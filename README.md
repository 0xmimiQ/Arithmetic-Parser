# Set up

```sh
sudo apt update
sudo apt install flex
sudo apt install bison
```

If your dev environment doesn't have gcc, you will need to install it as well.

# Excute

```sh
bison -d parser.y
flex parser.l
gcc lex.yy.c parser.tab.c
./a.out
```

# LICENSE

[MIT](./LICENSE.md)
