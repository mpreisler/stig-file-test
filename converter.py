#!/usr/bin/env python2

# This software may be freely redistributed under the terms of the GNU
# public license version 2.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
#
# This script converts stig file test from Steve Grubb to list of scripts
# for use with XCCDF+SCE

# Author: Martin Preisler <mpreisle@redhat.com>

def create_check(comment_line, lines):
    check_nr, rest = comment_line.split(") ", 1)
    check_name, description = rest.split(" ", 1)
    
    with open("output/stig-GEN00%s.sh" % (check_name), "w") as f:
        f.write("#!/usr/bin/env bash\n")
        f.write("\n")
        f.write("# Generated from content by Steve Grubb, GPLv2+\n")
        f.write("#\n")
        f.write("# original description: %s\n" % (description))
        f.write("\n")
        
        f.write("PATH=/bin:/usr/bin\n\n")
        f.write("# start a subshell\n")
        f.write("output=$(\n")
        for line in lines:
            f.write(line)

        f.write(")\n\n")
        f.write("# we captured output of the subshell, let's interpret it\n")
        f.write("if [ \"$output\" == \"\" ] ; then\n")
        f.write("    exit $XCCDF_RESULT_PASS\n")
        f.write("else\n")
        f.write("    # print the reason why we are failing\n")
        f.write("    echo \"$output\"\n")
        f.write("    exit $XCCDF_RESULT_FAIL\n")
        f.write("fi\n")
        f.write("\n")

def main():
    with open("stig-file-test.sh") as f:
        # we ignore the license clause and other bits
        ignoring = True
        # if True, we are collecting find lines waiting for the end of the check
        collecting_lines = False
        
        target_check = None
        line_accumulator = []
        
        for line in f.readlines():
            if line.startswith("PATH"):
                ignoring = False
                continue    
            
            # if the line is part of license clause or has no "meat" in it, skip it
            if ignoring or not line.strip(' \t\n\r'):
                continue

            if line.startswith("#") and not line.startswith("# "):
                if target_check is not None:
                    if not line_accumulator:
                        print("Warning: collected 0 lines for '%s', skipping" % (target_check))
                    else:
                        create_check(target_check.rstrip(" \t\n\r"), line_accumulator)
                
                target_check = line[1:]
                line_accumulator = []
                
            else:
                line_accumulator.append(line)
                    
if __name__ == "__main__":
    main()

