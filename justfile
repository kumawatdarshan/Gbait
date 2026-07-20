fmt:
    nix fmt

new-journal:
    #!/usr/bin/env fish
    set --local template ~/Templates/journal-template.md
    set --local epoch 2026-07-20

    # Anchor the day-count math in UTC so DST transitions can't skew the division.
    set --local epoch_secs (env TZ=UTC date -d "$epoch" +%s)
    set --local today_secs (env TZ=UTC date -d today +%s)
    set --local days_since (math -- floor \( $today_secs - $epoch_secs \) / 86400 )
    set --local week (math -- floor $days_since / 7 \+ 1)

    # Recompute this week's Monday in local time for display purposes.
    set --local monday (date -d "$epoch +"(math -- $week - 1)" weeks" +"%b %-d")
    set --local sunday (date -d "$epoch +"(math -- $week - 1)" weeks +6 days" +"%b %-d")

    set --local file journal/week-$week.md

    if not test -f $file
        if not test -f $template
            echo "Error: template not found at $template" >&2
            exit 1
        end

        mkdir -p journal
        sed -e "s/{n}/$week/g" \
            -e "s/{date range}/$monday – $sunday/g" \
            $template > $file

        echo "Created $file"
    end

    if not set --query VISUAL
        echo "Error: \$VISUAL is not set" >&2
        exit 1
    end

    $VISUAL $file
