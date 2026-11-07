# Codebase-Line-Counter

Bir proje klasöründeki kaynak dosyaları gezip hangi dilde kaç satır, kaç karakter kod yazıldığını gösteren küçük bir Python scripti. İstersen dosya dosya listesini de veriyor.

Kendi projelerimde "ne kadar kod yazmışım" sorusuna hızlıca cevap almak için yazdım.

```
ÖZET (dile göre)
Dil                Dosya   Satır     Kod  Yorum    Boş   Karakter     Pay
-----------------  -----  ------  ------  -----  -----  ---------  ------
QML                  167  31.070  26.841  1.346  2.883  1.282.181   45.9%
C++ (.cpp)            86  22.305  20.063    570  1.672    910.073   32.9%
Header (.h)           80   6.340   4.882    616    842    212.672    9.4%
Python (.py/.pyw)     26   4.228   3.618     74    536    174.599    6.2%
TOPLAM               412  67.728  58.600  2.891  6.237  2.727.661  100.0%
```

## Kurulum

Python 3 dışında bir şey gerekmiyor.

### Linux / macOS

```
git clone https://github.com/onatender/Codebase-Line-Counter.git
cd Codebase-Line-Counter
./install.sh
```

`install.sh` scripti `~/.local/bin/codebase` olarak bağlıyor. `~/.local/bin` PATH'te değilse `~/.bashrc` (ve varsa `~/.zshrc`) dosyasına ekliyor. Sonra yeni bir terminal açman yeterli.

Elle yapmak istersen:

```
chmod +x codebase
ln -s "$PWD/codebase" ~/.local/bin/codebase
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
```

### Windows

1. Repoyu bir klasöre indir, örneğin `C:\Tools\Codebase-Line-Counter`.
2. Bu klasörü PATH'e ekle. Başlat menüsünde "ortam değişkenleri" ara, "Kullanıcı değişkenleri" altında `Path` → Düzenle → Yeni, klasör yolunu yapıştır. Ya da PowerShell'de:

   ```
   [Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\Tools\Codebase-Line-Counter", "User")
   ```
3. Yeni bir terminal aç, `codebase` yaz. Klasördeki `codebase.bat` scripti Python ile çalıştırıyor.

## Kullanım

```
codebase                 # bulunduğun klasörün özeti
codebase ~/proje         # başka bir klasör
codebase -d              # dosya bazlı detaylı liste de göster
codebase -d -s lines     # detaylı listeyi satır sayısına göre sırala (path, lines, code, chars)
codebase -x tests        # bir klasörü ya da deseni hariç tut
codebase --no-git        # git'i yok say, klasörü doğrudan gez
codebase --only .cpp,.h  # sadece bu uzantılar
codebase --list          # tanınan uzantılar ve kalıcı ayarlar
```

Klasör bir git reposuysa sadece git'in takip ettiği dosyalara bakıyor, build çıktıları gibi şeyler zaten sayılmıyor. Git reposu değilse `build`, `venv`, `node_modules`, gizli klasörler gibi yerleri atlıyor. `moc_*`, `ui_*.h`, `.min.js` gibi üretilmiş dosyalar da sayılmıyor.

## Diller

Varsayılan olarak tanıdıkları: C, C++, header, C#, Java, Kotlin, Go, Rust, Swift, Dart, QML, JavaScript, TypeScript, HTML, Vue, CSS, SCSS/Sass/Less, PHP, Python, Ruby, Perl, R, Shell, PowerShell, Batch, Lua, SQL, CMake, Makefile, Dockerfile.

Listeyi kendine göre değiştirebilirsin:

|              | Bu seferlik                | Kalıcı                       |
|--------------|----------------------------|------------------------------|
| Uzantı ekle  | `codebase -e .zig:Zig://`  | `codebase --add .zig:Zig://` |
| Uzantı çıkar | `codebase --skip .html,.css` | `codebase --remove .html`  |

Ekleme biçimi `.uzantı:Dil adı:yorum işareti`. Dil adı ve yorum işareti yazılmayabilir. `//` verilirse `/* */` blokları da yorum sayılıyor.

Kalıcı çıkardığın bir uzantıyı geri açmak için `codebase --add .html` yeterli. Kalıcı eklediğini silmek için `codebase --remove .zig`.

Kalıcı ayarlar `~/.config/codebase/extensions` dosyasında duruyor, istersen elle de düzenleyebilirsin:

```
.zig:Zig://
-.html
```

## Bilinen sınırlar

Yorum satırı tespiti basit. Satır yorum işaretiyle başlıyorsa yorum sayılıyor. Kodun sonundaki yorumlar kod satırı olarak kalıyor. C'deki `#include` satırları da yorum değil kod olarak sayılıyor (C ailesinde sadece `//` ve `/* */` yorum).

Değişiklikler için [CHANGELOG.md](CHANGELOG.md).
