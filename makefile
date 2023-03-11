# Make SCM on Microsoft Code using sjasmplus
#
# Assumes that scw2sjasm.sh has been run against the codebase
# to modify the code for sjasmplus
#
# Created to allow build of SCWorkshop files on OSX in Microsoft Code
# Christian Stanton 2023

main_file=!Main
build_dir=build
scm="./$(build_dir)/$(main_file)"

SCMonitor: !Main.asm

# Remove and recreate build directory
	rm -rf ./$(build_dir)
	mkdir ./$(build_dir)

# Assemble!
	sjasmplus --fullpath --sym=$(scm).sym --lst=$(scm).lst --sld=$(scm).sld "$(main_file).asm"

# SCMonitor allows builds out of order, sjasmplus requires a linear build
# So scw2sjasm outputs seperate source files which have to be assembled or linked
	sh ./link.sh $(build_dir)

# EOF

