## Defines abbreviations
function setup
    for abbreviation in (abbr -l)
        abbr -e $abbreviation
    end
    abbr ll ls -lhA
    abbr ldir ls -lhd */
    abbr la ls -ap | grep -v / | egrep "^\."  
    fisher
end
