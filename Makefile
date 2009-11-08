.PHONY: clean lib echo


     AOBS = iml.spad cmbn.spad perm.spad symfuncnew.spad prtition.spad symfunc.spad make1.input

     DOCS = mydoc.dvi schick.dvi

     spad: $(OBJS) $(AOBS)

     lib: $(AOBS) $(OBJS) $(IOBS)

     doc:  $(DOCS)

     all:  $(AOBS) $(OBJS) $(DOCS)


     mydoc.dvi: $(TEXS)
	latex mydoc; 	latex mydoc

     schick.dvi: $(TEXSCHICK)
	latex schick; 	latex schick

     aux.ao: aux.as streampkg.ao
	$(ALDOR) aux.as

     streampkg.ao: streampkg.as
	$(ALDOR) streampkg.as

     myrandom.ao: myrandom.as
	$(ALDOR) myrandom.as

     mycombf.ao: mycombf.as streampkg.ao
	$(ALDOR) mycombf.as

     myfinite.ao: myfinite.as
	$(ALDOR) myfinite.as

     star.ao: star.as myfinite.ao mymatrix.ao
	$(ALDOR) star.as

     groups.ao: groups.as myfinite.ao
	$(ALDOR) groups.as

     coxeter.ao: coxeter.as aux.ao
	$(ALDOR) coxeter.as

     freeproduct.ao: freeproduct.as myfinite.ao
	$(ALDOR) freeproduct.as


     subgraphs.ao: subgraphs.as graphs.ao
	$(ALDOR) subgraphs.as

     monring0.ao: monring0.as star.ao
	$(ALDOR) monring0.as

     cumfunc.ao: cumfunc.as setpart.ao rgf.ao aux.ao
	$(ALDOR) cumfunc.as

     exsystem.ao: exsystem.as setpart.ao rgf.ao star.ao cumfunc.ao
	$(ALDOR) exsystem.as

     schick.ao: schick.as dirprodgr.ao myfinite.ao aux.ao monring0.ao star.ao setwbound.ao
	$(ALDOR) schick.as

     cuntz.ao: cuntz.as monring0.ao star.ao
	$(ALDOR) cuntz.as

     distro.ao: distro.as streampkg.ao setpart.ao
	$(ALDOR) distro.as

     rgf.ao: rgf.as streampkg.ao myrandom.ao mycombf.ao
	$(ALDOR) rgf.as

     setpart.ao: setpart.as rgf.ao poset.ao aux.ao
	$(ALDOR) setpart.as

     %.input: %.nw
	notangle  -R$@ $< > $@


     %.as: %.nw
#	notangle -L -R$@ $< > $@
	notangle  -R$@ $< > $@

     %.spad: %.spad.nw
#	notangle -L -R$@ $< > $@
#	notangle  -R$@ $< > $@
	notangle   $< > $@

     %.ao: %.as $(AOBS);
	$(ALDOR) $<

     %.tex: %.nw
	noweave -delay -x $< > $@


     clean:
	rm -f *.ao *.o *.asy *.fn *.lsp

#test
     testcum1.as: testcum.nw
	notangle  -R$@ $< > $@
     testcum1.input: testcum.nw
	notangle  -R$@ $< > $@

     testcum2.as: testcum.nw
	notangle  -R$@ $< > $@
     testcum2.input: testcum.nw
	notangle  -R$@ $< > $@

     test: $(TESTOBS)
