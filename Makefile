MODULES = 01

default: index.html syllabus.html acknowledge.html rubric_homework.html rubric_participation.html 

include rules.mk

.fresh:
	for module in $(MODULES); do (cd $$module && $(MAKE) fresh); done

fresh: .fresh

