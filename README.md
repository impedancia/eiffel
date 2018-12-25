Eiffel ZH - 2012. január 19.

A feladat egy irányított gráfot reprezentáló adattípus implementálása. Az alapfeladat elvégzése után a
feladatok tetszőleges sorrendben elvégezhetőek. Minden jól megoldott feladat +1 jegyet ér.

Alapfeladat

Készítsünk egy DIGRAPH osztályt, amely egy irányított gráfot ábrázol. A gráf csúcspontjaiban tárolt elemek
típusát sablonparaméterként kapjuk. Ez az elemtípus HASHABLE kell legyen. A gráfot ábrázoljuk hasítótáblával
a következőképpen: a kulcsok értelemszerűen a csúcsok lesznek, egy kulcshoz pedig azon csúcsok halmazát
rendeljük, ahova vezet él. Használjuk az Eiffel beépített HASH_TABLE és ARRAYED_SET 1
 típusát.
Valósítsuk meg a legfontosabb gráfműveleteket: csúcs hozzáadása, él létrehozása, és egy feature-t, ami
eldönti, hogy van-e él két csúcs között.
Biztosítsuk azt, hogy élet csak akkor tudunk létrehozni, ha a végpontjai ebben a gráfban vannak.
A gráf a creation feature-ét örökölje a hasítótáblából (csak nevezzük át init-nek!), amely
paraméterként a hasítótábla kapacitását kapja.

Irányítatlan gráf
Készítsünk egy olyan GRAPH osztályt, amelyet a DIGRAPH osztályból származtatunk, és egy irányítatlan gráfot
valósít meg. Ezt úgy érhetjük el, hogy az élet mindkét irányba felvesszük.

Unió
Készítsünk olyan creation feature-t a DIGRAPH osztályban, amely két gráfot kap paraméterként, és egy olyat
hoz létre, amely a két paraméter uniója. A típushelyesség biztosítása mellett (azaz egy irányítatlan gráf nem
kaphat irányított gráfot) oldjuk meg, hogy az implementációt ne kelljen felüldefiniálni a GRAPH osztályban.

Bejárás
Készítsünk egy feature-t, amely a gráf mélységi bejárását végezi el. A feature egy ágenst kap paraméterben,
és ezt az ágenst hívja meg minden csúcsra a bejárás során.

Jó munkát!


Racionális számok

Valósítsd meg a FRACTION osztályt, mely két egész számból álló törtek reprezentálására szolgál. A számlálót a
numerator, a nevezőt a denominator mező ábrázolja. A nevező nem lehet nulla. Egy törtet lehessen make
eljárással inicializálni, melynek két paramétere a számláló és a nevező legyen. Egy másik létrehozó eljárás a
from_integer legyen, mely egy egész számot vár paraméterként, és ez lesz a számláló (a nevező pedig egy).
Készíts szorzás és osztás függvényt a FRACTION osztályhoz.

(create{FRACTION}.from_integer(4))
.divided_by(
 (create{FRACTION}.from_integer(2)).times(create{FRACTION}.make(6,4))
 )

Definiáljuk felül az is_equal és out műveleteket értelemszerűen.

Tartalmazzon a FRACTION osztály egy simplify eljárást is, amely leegyszerűsíti a törtet: a nevező pozitív lesz,
a számláló és a nevező legnagyobb közös osztója pedig 1. A nulla értékű tört nevezője egyszerűsítés után
legyen egy.

A simplify művelethez készíts gcd segédfüggvényt, mely kiszámítja a számláló és a nevező legnagyobb
közös osztóját az euklideszi algoritmussal. (A pozitív a és a nemnegatív b lnko-ját úgy számoljuk, hogy amíg
b pozitív, értékül adjuk a-nak és b-nek rendre a b-t, illetve az a és a b osztási maradékát.) A művelet legyen
ciklussal (nem rekurzívan) megvalósítva.

A gcd művelet legyen a FRACTION osztály és az összes leszármazottja számára látható. A fentebb megnevezett
műveletek legyen nyilvánosak.

Ne feledkezz meg a szerződések használatáról!

Készíts főprogramot, amelyben teszteled a FRACTION osztályt. A főprogram neve legyen APPLICATION.make. A
projektfájlban legyen bekapcsolva az összes szerződésellenőrzés.

Nehezítések

Legyen a FRACTION osztály nem referenciával ábrázolt osztály.
Legyen az osztály öninicializáló (self-initializing), és a kezdőértéke legyen 0 / 1.
A szorzás és osztás műveletek legyenek operátorként is használhatók.
Konvertálódjanak az egész számok FRACTION-re.
4 / (2 * create{FRACTION}.make(6,4))

Komolyabb nehezítés

Készítsd el a RATIONAL osztályt, mely privát (non-konform módon) örököl a FRACTION osztályból. A racionális
számok mindig leegyszerűsítve legyenek ábrázolva. A FRACTION objektumok konvertálódjanak RATIONAL
típusra. Az is_equal leegyszerűsödik: legyen az ANY-beli, sekély változat.