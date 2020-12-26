# Bootsector Print
This project is just a simple bootsector program that prints some text.
Nothing more, nothing less.

## Compiling
```bash
$ nasm -fbin bootsector.asm -o bootsector.img
```
To check out the raw binary data, use `hexdump`:
```bash
$ hexdump -C bootsector.img
```

## Running
<p>I use VirtualBox:</p>
<img src="https://github.com/ktkk/bootsector-print/blob/master/virtualbox.png">
