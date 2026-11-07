# Codebase-Line-Counter

Bir proje klasöründeki kaynak dosyaları gezip her dosyanın kaç satır olduğunu, toplamda hangi dilde ne kadar kod yazıldığını gösteren küçük bir Python scripti.

Kendi projelerimde "ne kadar kod yazmışım" sorusuna hızlıca cevap almak için yazdım.

## Ne sayıyor

Varsayılan olarak tanıdığı diller: C, C++, header, C#, Java, Kotlin, Go, Rust, Swift, Dart, QML, JavaScript, TypeScript, HTML, Vue, CSS, SCSS/Sass/Less, PHP, Python, Ruby, Perl, R, Shell, PowerShell, Batch, Lua, SQL, CMake, Makefile, Dockerfile.

Tam liste için `codebase --list`.

Her dosya için toplam satır, kod, yorum, boş satır ve karakter sayısı; sonunda da dile göre bir özet tablo çıkarıyor.

Klasör bir git reposuysa sadece git'in takip ettiği dosyalara bakıyor, yani build çıktıları gibi şeyler zaten sayılmıyor. Git reposu değilse `build`, `venv`, `node_modules`, gizli klasörler gibi yerleri atlıyor. Qt'nin ürettiği `moc_*`, `ui_*.h`, `qrc_*` dosyaları da sayılmıyor.

## Kurulum

Python 3 dışında bir şey gerekmiyor.

```
git clone https://github.com/onatender/Codebase-Line-Counter.git
chmod +x Codebase-Line-Counter/codebase
ln -s "$PWD/Codebase-Line-Counter/codebase" ~/.local/bin/codebase
```

`~/.local/bin` PATH'te olmalı.

## Kullanım

```
codebase                 # bulunduğun klasör
codebase ~/proje         # başka bir klasör
codebase -s lines        # en uzun dosyalar üstte
codebase --summary       # sadece özet
codebase -x tests        # bir klasörü hariç tut
codebase --no-git        # git'i yok say
codebase --only .cpp,.h  # sadece bu uzantılar
codebase --list          # tanınan uzantılar
```

## Listede olmayan bir uzantı eklemek

Tek seferlik:

```
codebase -e .zig:Zig://
```

Biçim `.uzantı:Dil adı:yorum işareti`. Dil adı ve yorum işareti yazılmayabilir. Yorum işareti `//` verilirse `/* */` blokları da yorum sayılıyor.

Kalıcı olsun istersen `~/.config/codebase/extensions` dosyasına her satıra bir tane yaz:

```
.zig:Zig://
.nim:Nim:#
.asm:Assembly:;
```

Var olan bir uzantıyı da buradan farklı bir dil adıyla yeniden tanımlayabilirsin.

Örnek özet:

```
Dil                Dosya   Satır     Kod  Yorum    Boş   Karakter     Pay
-----------------  -----  ------  ------  -----  -----  ---------  ------
QML                  167  31.070  26.841  1.346  2.883  1.282.181   46.0%
C++ (.cpp)            86  22.305  20.063    570  1.672    910.073   33.0%
Header (.h)           80   6.340   4.882    616    842    212.672    9.4%
Python (.py/.pyw)     26   4.228   3.618     74    536    174.599    6.3%
TOPLAM               408  67.513  58.425  2.881  6.207  2.719.799  100.0%
```

Not: yorum satırı tespiti basit. Satır `//`, `/*`, `#` ile başlıyorsa yorum sayılıyor, kodun sonundaki yorumlar kod satırı olarak kalıyor. C'deki `#include` satırları da bu yüzden yorum sayılıyor.
