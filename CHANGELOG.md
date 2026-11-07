# Değişiklikler

## 1.3 - 2026-11-07

- Varsayılan çıktı artık sadece özet tablo. Dosya bazlı liste için `-d` / `--detailed`. `--summary` kaldırıldı.
- `--add` ve `--remove` ile uzantılar ayar dosyasını elle açmadan kalıcı eklenip çıkarılabiliyor.
- `--list` kalıcı ayarları da gösteriyor.
- Linux/macOS için `install.sh`, Windows için `codebase.bat` eklendi. README'ye PATH'e ekleme adımları yazıldı.

## 1.2 - 2026-11-07

- `--skip .html,.css` ile istenmeyen uzantılar o seferlik sayılmıyor.
- Ayar dosyasında başına `-` konan satır (`-.html`) o uzantıyı kalıcı olarak çıkarıyor.

## 1.1 - 2026-11-07

- Varsayılan dillere Java, C#, Kotlin, Go, Rust, Swift, Dart, TypeScript, HTML, Vue, CSS, SCSS, PHP, Ruby, Perl, R, PowerShell, Lua, SQL, Makefile ve Dockerfile eklendi.
- `-e .uzantı:Dil:yorum` ile listede olmayan bir uzantı sayılabiliyor.
- `~/.config/codebase/extensions` dosyasına yazılan uzantılar her çalıştırmada okunuyor.
- `--only` ile sadece belirli uzantılar sayılabiliyor.
- `--list` tanınan uzantıları gösteriyor.
- Git dışı modda `obj`, `target` klasörleri ve `.min.js`, `.min.css` dosyaları atlanıyor.

## 1.0 - 2026-11-07

- İlk sürüm. C, C++, QML, Python, Shell, Batch, JavaScript ve CMake dosyalarının satır, kod, yorum, boş satır ve karakter sayısı.
