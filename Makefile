##-*- makefile -*-############################################################
#
#  System        : 
#  Module        : 
#  Object Name   : $RCSfile$
#  Revision      : $Revision$
#  Date          : $Date$
#  Author        : $Author$
#  Created By    : Robert Heller
#  Created       : Tue Sep 15 09:22:28 2020
#  Last Modified : <200915.0927>
#
#  Description	
#
#  Notes
#
#  History
#	
#  $Log$
#
##############################################################################
#
#    Copyright (C) 2020  Robert Heller D/B/A Deepwoods Software
#			51 Locke Hill Road
#			Wendell, MA 01379-9728
#
#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program; if not, write to the Free Software
#    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
#
# 
#
##############################################################################


PDFLATEX = /usr/bin/pdflatex

all: WhyTheMLBShouldBeElected.pdf


WhyTheMLBShouldBeElected.pdf: clean WhyTheMLBShouldBeElected.tex
	$(PDFLATEX) WhyTheMLBShouldBeElected.tex
	$(PDFLATEX) WhyTheMLBShouldBeElected.tex
	$(PDFLATEX) WhyTheMLBShouldBeElected.tex
	latex_count=5 ; \
	while egrep -s 'Rerun (LaTeX|to get cross-references right)' WhyTheMLBShouldBeElected.log && [ $$latex_count -gt 0 ] ;\
		do \
		   echo "Rerunning latex...." ;\
		   $(PDFLATEX) WhyTheMLBShouldBeElected.tex ;\
		   latex_count=`expr $$latex_count - 1` ;\
		done

clean:
	rm -f *.ps *.dvi *.aux *.toc *.idx *.ind *.ilg *.log *.out WhyTheMLBShouldBeElected.pdf
