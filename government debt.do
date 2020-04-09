gen lngrp=log(grorgpdut_all*10000)
gen lnrjgrp=log( pcptlgrp_all )
gen sgrp=scidpcgrp/100
gen investgrp=ivstfxast_all/ grorgpdut_all
gen urbanrate= auavption/ auavption_all
gen chizi= (pubrnue_all- pubfinaepd_all)/ grorgpdut_all
gen finrisk= (lantbkstye_all- hodsvdpsye_all)/pubrnue_all
gen lnplat=log( platdsity_all )
gen debtgrp= debt*10000/grorgpdut_all
gen debtgrp2=debtgrp*debtgrp
encode cityname,gen(citycode)
xtset citycode year
xtdes
asdoc sum
asdoc sum if cluster==1
asdoc sum if cluster==2
asdoc sum if cluster==3

xtreg lngrp debtgrp lnrjgrp sgrp investgrp urbanrate chizi finrisk lnplat i.citycode i.year, fe
est sto fe1
xtreg lngrp debtgrp lnrjgrp sgrp investgrp urbanrate chizi finrisk lnplat i.citycode i.year, re
est sto re1
hausman fe1 re1, sigmamore

xtreg lngrp debtgrp debtgrp2 lnrjgrp sgrp investgrp urbanrate chizi finrisk lnplat i.citycode i.year, fe
est sto fe2
xtreg lngrp debtgrp debtgrp2 lnrjgrp sgrp investgrp urbanrate chizi finrisk lnplat i.citycode i.year, re
est sto re2
hausman fe2 re2, sigmamore

xtreg lngrp debtgrp dd2 lnrjgrp sgrp investgrp urbanrate chizi finrisk lnplat i.citycode i.year, fe
est sto fe3
xtreg lngrp debtgrp dd2 lnrjgrp sgrp investgrp urbanrate chizi finrisk lnplat i.citycode i.year, re
est sto re3
hausman fe3 re3, sigmamore

xtreg lngrp debtgrp dd3 lnrjgrp sgrp investgrp urbanrate chizi finrisk lnplat i.citycode i.year, fe
est sto fe4
xtreg lngrp debtgrp dd3 lnrjgrp sgrp investgrp urbanrate chizi finrisk lnplat i.citycode i.year, re
est sto re4
hausman fe4 re4, sigmamore

gen dd2debt=dd2*debtgrp
gen dd3debt=dd3*debtgrp
xtreg lngrp debtgrp dd2 dd2debt lnrjgrp sgrp investgrp urbanrate chizi finrisk lnplat i.citycode i.year, fe
est sto fe5
xtreg lngrp debtgrp dd2 dd2debt lnrjgrp sgrp investgrp urbanrate chizi finrisk lnplat i.citycode i.year, re
est sto re5
hausman fe5 re5, sigmamore

xtreg lngrp debtgrp dd3 dd3debt lnrjgrp sgrp investgrp urbanrate chizi finrisk lnplat i.citycode i.year, fe
est sto fe6
xtreg lngrp debtgrp dd3 dd3debt lnrjgrp sgrp investgrp urbanrate chizi finrisk lnplat i.citycode i.year, re
est sto re6
hausman fe6 re6, sigmamore

gen ldebtgrp=l.debtgrp
gen ldebtgrp2=l.debtgrp2
gen llnrjgrp=l.lnrjgrp
gen lsgrp=l.sgrp
gen linvestgrp=l.investgrp
gen lurbanrate=l.urbanrate
gen lchizi=l.chizi
gen lfinrisk=l.finrisk
gen llnplat=l.lnplat
gen ldd2=l.dd2
gen ldd3=l.dd3
gen ldd2debt=l.dd2debt
gen ldd3debt=l.dd3debt

xtreg lngrp ldebtgrp llnrjgrp lsgrp linvestgrp lurbanrate lchizi lfinrisk llnplat i.citycode i.year, fe
est sto fe7
xtreg lngrp ldebtgrp llnrjgrp lsgrp linvestgrp lurbanrate lchizi lfinrisk llnplat i.citycode i.year, re
est sto re7
hausman fe7 re7, sigmamore

xtreg lngrp ldebtgrp ldebtgrp2 llnrjgrp lsgrp linvestgrp lurbanrate lchizi lfinrisk llnplat i.citycode i.year, fe
est sto fe8
xtreg lngrp ldebtgrp ldebtgrp2 llnrjgrp lsgrp linvestgrp lurbanrate lchizi lfinrisk llnplat i.citycode i.year, re
est sto re8
hausman fe8 re8, sigmamore

xtreg lngrp ldebtgrp ldd2 llnrjgrp lsgrp linvestgrp lurbanrate lchizi lfinrisk llnplat i.citycode i.year, fe
est sto fe9
xtreg lngrp ldebtgrp ldd2 llnrjgrp lsgrp linvestgrp lurbanrate lchizi lfinrisk llnplat i.citycode i.year, re
est sto re9
hausman fe9 re9, sigmamore

xtreg lngrp ldebtgrp ldd3 llnrjgrp lsgrp linvestgrp lurbanrate lchizi lfinrisk llnplat i.citycode i.year, fe
est sto fe10
xtreg lngrp ldebtgrp ldd3 llnrjgrp lsgrp linvestgrp lurbanrate lchizi lfinrisk llnplat i.citycode i.year, re
est sto re10
hausman fe10 re10, sigmamore

xtreg lngrp ldebtgrp ldd2 ldd2debt llnrjgrp lsgrp linvestgrp lurbanrate lchizi lfinrisk llnplat i.citycode i.year, fe
est sto fe11
xtreg lngrp ldebtgrp ldd2 ldd2debt llnrjgrp lsgrp linvestgrp lurbanrate lchizi lfinrisk llnplat i.citycode i.year, re
est sto re11
hausman fe11 re11, sigmamore

xtreg lngrp ldebtgrp ldd3 ldd3debt llnrjgrp lsgrp linvestgrp lurbanrate lchizi lfinrisk llnplat i.citycode i.year, fe
est sto fe12
xtreg lngrp ldebtgrp ldd3 ldd3debt llnrjgrp lsgrp linvestgrp lurbanrate lchizi lfinrisk llnplat i.citycode i.year, re
est sto re12
hausman fe12 re12, sigmamore

*不同地区：
xtreg lngrp debtgrp lnrjgrp sgrp investgrp urbanrate chizi finrisk lnplat i.citycode i.year, fe
est sto fe1
xtreg lngrp debtgrp lnrjgrp sgrp investgrp urbanrate chizi finrisk lnplat i.citycode i.year, re
est sto re1
hausman fe1 re1, sigmamore

xtreg lngrp debtgrp debtgrp2 lnrjgrp sgrp investgrp urbanrate chizi finrisk lnplat i.citycode i.year, fe
est sto fe2
xtreg lngrp debtgrp debtgrp2 lnrjgrp sgrp investgrp urbanrate chizi finrisk lnplat i.citycode i.year, re
est sto re2
hausman fe2 re2, sigmamore

xtreg lngrp debtgrp dd2 lnrjgrp sgrp investgrp urbanrate chizi finrisk lnplat i.citycode i.year, fe
est sto fe3
xtreg lngrp debtgrp dd2 lnrjgrp sgrp investgrp urbanrate chizi finrisk lnplat i.citycode i.year, re
est sto re3
hausman fe3 re3, sigmamore

xtreg lngrp debtgrp dd3 lnrjgrp sgrp investgrp urbanrate chizi finrisk lnplat i.citycode i.year, fe
est sto fe4
xtreg lngrp debtgrp dd3 lnrjgrp sgrp investgrp urbanrate chizi finrisk lnplat i.citycode i.year, re
est sto re4
hausman fe4 re4, sigmamore

gen dd2debt=dd2*debtgrp
gen dd3debt=dd3*debtgrp
xtreg lngrp debtgrp dd2 dd2debt lnrjgrp sgrp investgrp urbanrate chizi finrisk lnplat i.citycode i.year, fe
est sto fe5
xtreg lngrp debtgrp dd2 dd2debt lnrjgrp sgrp investgrp urbanrate chizi finrisk lnplat i.citycode i.year, re
est sto re5
hausman fe5 re5, sigmamore

xtreg lngrp debtgrp dd3 dd3debt lnrjgrp sgrp investgrp urbanrate chizi finrisk lnplat i.citycode i.year, fe
est sto fe6
xtreg lngrp debtgrp dd3 dd3debt lnrjgrp sgrp investgrp urbanrate chizi finrisk lnplat i.citycode i.year, re
est sto re6
hausman fe6 re6, sigmamore
