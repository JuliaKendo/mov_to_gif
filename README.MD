# Конвертация видео в gif с использованием FFmpeg и ImageMagick.

Простой скрипт командной строки который конвертирует mov файлы в gif. В описании пример установки для mac os на процессоре m1. Полагаю что на linux все будет работать аналогично, с использованием другого менеджера пакетов. 


# Содержание

- [Установка](#установка)
- [Конвертация](#конвертация)
- [Ресурсы](#ресурсы)


# Установка

Перед использованием скрипта необходимо установить используемые библиотеки:

Установка [FFmpeg](https://formulae.brew.sh/formula/ffmpeg#default)

```bash
brew install ffmpeg
```

Установка [ImageMagick](https://formulae.brew.sh/formula/imagemagick#default)

```bash
brew install imagemagick
```

Скачайте файл `to_gif.sh` в нужную директорию.
Выполните `chmod 700 to_gif.sh` для установки прав на запуск.
Создайте служебную папку для временных файлов конвертации `mkdir output`


# Конвертация

```bash
$ ./to_gif.sh file.mov
```

В качестве единственного параметра скрипта укажите имя файла для конвертации.
Итоговый файл будет сформирован с тем же именем, с расширением gif.


# Ресурсы

[Install brew on Silicon apple m1](https://brew.sh)
[gist.github.com/tskaggs](https://gist.github.com/tskaggs/6394639)

