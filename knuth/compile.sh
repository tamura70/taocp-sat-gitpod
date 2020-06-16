#!/bin/bash -x
set -e
mkdir bin
GB="gb_graph.c gb_basic.c gb_io.c gb_save.c gb_sort.c gb_words.c gb_gates.c gb_flip.c"
cd sgb
gcc -w -o ../bin/assign_lisa assign_lisa.c gb_lisa.c $GB
gcc -w -o ../bin/blank blank.c $GB
gcc -w -o ../bin/book_components book_components.c gb_books.c $GB
gcc -w -o ../bin/econ_order econ_order.c gb_econ.c $GB
gcc -w -o ../bin/football football.c gb_games.c $GB
gcc -w -o ../bin/girth girth.c gb_raman.c $GB
gcc -w -o ../bin/ladders ladders.c gb_dijk.c $GB
gcc -w -o ../bin/miles_span miles_span.c gb_miles.c $GB
gcc -w -o ../bin/multiply multiply.c $GB
gcc -w -o ../bin/queen queen.c $GB
gcc -w -o ../bin/roget_components roget_components.c gb_roget.c $GB
gcc -w -o ../bin/take_risc take_risc.c $GB
gcc -w -o ../bin/word_components word_components.c $GB
gcc -w -o ../bin/word_giant word_giant.c $GB
cd ..
GBF="gb_flip.c"
cd sat-solvers
gcc -w -o ../bin/dimacs-to-sat dimacs-to-sat.c $GBF
gcc -w -o ../bin/sat-commafree sat-commafree.c $GBF
gcc -w -o ../bin/sat-nfa sat-nfa.c $GBF
gcc -w -o ../bin/sat-to-dimacs sat-to-dimacs.c $GBF
gcc -w -o ../bin/sat0 sat0.c $GBF
gcc -w -o ../bin/sat0w sat0w.c $GBF
gcc -w -o ../bin/sat10 sat10.c $GBF
gcc -w -o ../bin/sat11 sat11.c $GBF
gcc -w -o ../bin/sat12-erp sat12-erp.c $GBF
gcc -w -o ../bin/sat12 sat12.c $GBF
gcc -w -o ../bin/sat13 sat13.c $GBF
gcc -w -o ../bin/sat8 sat8.c $GBF
gcc -w -o ../bin/sat9 sat9.c $GBF
gcc -w -o ../bin/sat11k sat11k.c $GBF
cd ..
cd sat-examples
cd sources
gcc -w -o ../../bin/ezgraph ezgraph.c $GB
gcc -w -o ../../bin/flower-snark-line flower-snark-line.c $GB
gcc -w -o ../../bin/gates-stuck gates-stuck.c $GB
gcc -w -o ../../bin/gates-to-wires gates-to-wires.c $GB
gcc -w -o ../../bin/graph-cyc graph-cyc.c $GB
gcc -w -o ../../bin/langford langford.c $GB
gcc -w -o ../../bin/make_prod make_prod.c $GB
gcc -w -o ../../bin/makeboard makeboard.c $GB
gcc -w -o ../../bin/mcgregor-graph mcgregor-graph.c $GB
gcc -w -o ../../bin/oss-data oss-data.c $GB
gcc -w -o ../../bin/queen-graph queen-graph.c $GB
# gcc -w -o ../../bin/rand-d4g6 rand-d4g6.c $GB
gcc -w -o ../../bin/sat-arithprog sat-arithprog.c $GB
gcc -w -o ../../bin/sat-chains sat-chains.c $GB
gcc -w -o ../../bin/sat-closest-string-dat sat-closest-string-dat.c $GB
gcc -w -o ../../bin/sat-closest-string sat-closest-string.c $GB
gcc -w -o ../../bin/sat-color-exclusion sat-color-exclusion.c $GB
gcc -w -o ../../bin/sat-color-kernel sat-color-kernel.c $GB
gcc -w -o ../../bin/sat-color-log sat-color-log.c $GB
gcc -w -o ../../bin/sat-color-log2 sat-color-log2.c $GB
gcc -w -o ../../bin/sat-color-log3 sat-color-log3.c $GB
gcc -w -o ../../bin/sat-color-order sat-color-order.c $GB
gcc -w -o ../../bin/sat-color sat-color.c $GB
gcc -w -o ../../bin/sat-connection sat-connection.c $GB
gcc -w -o ../../bin/sat-dadda sat-dadda.c $GB
gcc -w -o ../../bin/sat-dance sat-dance.c $GB
gcc -w -o ../../bin/sat-erdos-disc sat-erdos-disc.c $GB
gcc -w -o ../../bin/sat-eulerian-balance sat-eulerian-balance.c $GB
gcc -w -o ../../bin/sat-gates-stuck sat-gates-stuck.c $GB
gcc -w -o ../../bin/sat-graph-quench sat-graph-quench.c $GB
gcc -w -o ../../bin/sat-life-filter sat-life-filter.c $GB
gcc -w -o ../../bin/sat-life sat-life.c $GB
gcc -w -o ../../bin/sat-mintime-sort sat-mintime-sort.c $GB
gcc -w -o ../../bin/sat-mutex sat-mutex.c $GB
gcc -w -o ../../bin/sat-newlangford sat-newlangford.c $GB
gcc -w -o ../../bin/sat-oss sat-oss.c $GB
gcc -w -o ../../bin/sat-poset-nomax sat-poset-nomax.c $GB
gcc -w -o ../../bin/sat-queens-color-order-cliques sat-queens-color-order-cliques.c $GB
gcc -w -o ../../bin/sat-queens-color-order-cliques2 sat-queens-color-order-cliques2.c $GB
gcc -w -o ../../bin/sat-rand-rep sat-rand-rep.c $GB
gcc -w -o ../../bin/sat-synth-data sat-synth-data.c $GB
gcc -w -o ../../bin/sat-synth sat-synth.c $GB
gcc -w -o ../../bin/sat-tatami sat-tatami.c $GB
gcc -w -o ../../bin/sat-threshold-bb-equal sat-threshold-bb-equal.c $GB
gcc -w -o ../../bin/sat-threshold-bb sat-threshold-bb.c $GB
gcc -w -o ../../bin/sat-threshold-sinz sat-threshold-sinz.c $GB
gcc -w -o ../../bin/sat-tomography-filter sat-tomography-filter.c $GB
gcc -w -o ../../bin/sat-tomography-prep sat-tomography-prep.c $GB
gcc -w -o ../../bin/sat-tomography sat-tomography.c $GB
gcc -w -o ../../bin/sat-tseytin sat-tseytin.c $GB
gcc -w -o ../../bin/sat-waerden sat-waerden.c $GB
gcc -w -o ../../bin/sat-zarank sat-zarank.c $GB
gcc -w -o ../../bin/ezgraph-named ezgraph-named.c $GB
gcc -w -o ../../bin/sat-chains-lex-1234 sat-chains-lex-1234.c $GB
gcc -w -o ../../bin/sat-color-snark-subset sat-color-snark-subset.c $GB
gcc -w -o ../../bin/sat-color-snark1 sat-color-snark1.c $GB
gcc -w -o ../../bin/sat-color-snark2 sat-color-snark2.c $GB
gcc -w -o ../../bin/sat-color-snark3 sat-color-snark3.c $GB
gcc -w -o ../../bin/sat-color-snark4 sat-color-snark4.c $GB
gcc -w -o ../../bin/sat-color-snark5 sat-color-snark5.c $GB
gcc -w -o ../../bin/sat-dadda-lifo sat-dadda-lifo.c $GB
gcc -w -o ../../bin/sat-dadda-miter sat-dadda-miter.c $GB
gcc -w -o ../../bin/sat-dance-aspvall sat-dance-aspvall.c $GB
gcc -w -o ../../bin/sat-dance-heule sat-dance-heule.c $GB
gcc -w -o ../../bin/sat-dance-prestwich sat-dance-prestwich.c $GB
gcc -w -o ../../bin/sat-erdos-disc-res sat-erdos-disc-res.c $GB
gcc -w -o ../../bin/sat-gates-stuck-namekludge sat-gates-stuck-namekludge.c $GB
gcc -w -o ../../bin/sat-graph-cyc sat-graph-cyc.c $GB
gcc -w -o ../../bin/sat-graph-quench-noncomm-latebinding-random sat-graph-quench-noncomm-latebinding-random.c $GB
gcc -w -o ../../bin/sat-life-grid sat-life-grid.c $GB
gcc -w -o ../../bin/sat-life-upper sat-life-upper.c $GB
gcc -w -o ../../bin/sat-mutex-distinct-lemmas sat-mutex-distinct-lemmas.c $GB
gcc -w -o ../../bin/sat-mutex-distinct sat-mutex-distinct.c $GB
gcc -w -o ../../bin/sat-mutex-starve-lemmas sat-mutex-starve-lemmas.c $GB
gcc -w -o ../../bin/sat-mutex-starve sat-mutex-starve.c $GB
gcc -w -o ../../bin/sat-oss-sym-scaled sat-oss-sym-scaled.c $GB
gcc -w -o ../../bin/sat-oss-sym sat-oss-sym.c $GB
gcc -w -o ../../bin/sat-poset-nomax-a sat-poset-nomax-a.c $GB
gcc -w -o ../../bin/sat-poset-nomax-b sat-poset-nomax-b.c $GB
gcc -w -o ../../bin/sat-queens-color-order-organpipe sat-queens-color-order-organpipe.c $GB
gcc -w -o ../../bin/sat-synth-trunc-kluj sat-synth-trunc-kluj.c $GB
gcc -w -o ../../bin/sat-tatami-mutilated sat-tatami-mutilated.c $GB
gcc -w -o ../../bin/sat-threshold-bb-graphs-double sat-threshold-bb-graphs-double.c $GB
gcc -w -o ../../bin/sat-threshold-bb-graphs sat-threshold-bb-graphs.c $GB
gcc -w -o ../../bin/sat-threshold-bb-life15 sat-threshold-bb-life15.c $GB
gcc -w -o ../../bin/sat-threshold-sinz-graphs sat-threshold-sinz-graphs.c $GB
# gcc -w -o ../../bin/sat-tomography-2nd sat-tomography-2nd.c $GB
gcc -w -o ../../bin/sat-tomography-prep-2nd sat-tomography-prep-2nd.c $GB
gcc -w -o ../../bin/sat-zarank-symm sat-zarank-symm.c $GB
cd ..
cd ..
cd sat-life
gcc -w -o ../bin/sat-life-filter sat-life-filter.c
gcc -w -o ../bin/sat-life sat-life.c
gcc -w -o ../bin/sat-life-grid-cycle sat-life-grid-cycle.c
gcc -w -o ../bin/sat-life-grid-eater sat-life-grid-eater.c
gcc -w -o ../bin/sat-life-grid-spaceships-sym sat-life-grid-spaceships-sym.c
gcc -w -o ../bin/sat-life-grid-spaceships sat-life-grid-spaceships.c
gcc -w -o ../bin/sat-life-grid sat-life-grid.c
gcc -w -o ../bin/sat-life-grid90-cycle sat-life-grid90-cycle.c
gcc -w -o ../bin/sat-life-grid90 sat-life-grid90.c
gcc -w -o ../bin/sat-life-gridquad-cycle sat-life-gridquad-cycle.c
gcc -w -o ../bin/sat-life-gridquad sat-life-gridquad.c
gcc -w -o ../bin/sat-life-torus-cycle sat-life-torus-cycle.c
gcc -w -o ../bin/sat-life-torus sat-life-torus.c
gcc -w -o ../bin/sat-life-upper sat-life-upper.c
cd ..
