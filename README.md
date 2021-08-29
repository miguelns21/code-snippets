# code-snippets
# Fragmentos de código sencillos

## GitRepoInstall_Update.sh

Este script actualizara los repositorios que han sido previamente "bifurcados" en mi repositoro de github para mantenerlos actualizados.

Este proceso se hará en varias fases:

1. Crear un fork del proyecto deseado en mi repositorio de github. (proceso manual)

2. Ejecutar el script GitRepoInstall_update.sh en el ordenador local.

    2.1. Clonación del repositorio en local
    ```bash
    root@linuxito:~/github# git clone https://github.com/linuxitux/sysstatgraph.git
    Cloning into 'sysstatgraph'...
    remote: Counting objects: 24, done.
    remote: Total 24 (delta 0), reused 0 (delta 0), pack-reused 24
    Unpacking objects: 100% (24/24), done.
    ```
    2.2. Conectar el proyecto de la página github original del proyecto con nuestra copia local.
    ```bash
    root@linuxito:~/github/sysstatgraph# git remote add upstream https://github.com/magnetikonline/sysstatgraph.git
    ```
    2.3. De esta forma nuestro repositorio local estará conectado con nuestro fork (origin) y también con el proyecto original (upstream) como puede verse en:
    ```
    git remote -v
    ```
    2.4. Finalmente traemos las últimas actualizaciones del github original a nuestro github bifurcado local.
    ```bash
    git pull upstream master
    ```
    2.5. Ahora podemos también actualizar nuestro proyecto bifurcado en Github (origin)
    ```bash
    git push origin master
    ```

El trabajo original es de [linuxito](https://www.linuxito.com/programacion/890-como-mantener-tu-fork-sincronizado-con-upstream-en-git)

## Funciones para .bashrc o .zshrc
```bash
# Extract nmap information
function extractPorts(){
    ports="$(cat $1 | grep -oP '\d{1,5}/open' | awk '{print $1}' FS='/' | xargs | tr ' ' ',')"
    ip_address="$(cat $1 | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort -u | head -n 1)"
    echo -e "\n[*] Extracting information...\n" > extractPorts.tmp
    echo -e "\t[*] IP Address: $ip_address"  >> extractPorts.tmp
    echo -e "\t[*] Open ports: $ports\n"  >> extractPorts.tmp
    echo $ports | tr -d '\n' | xclip -sel clip
    echo -e "[*] Ports copied to clipboard\n"  >> extractPorts.tmp
    cat extractPorts.tmp; rm extractPorts.tmp
}
```
Requiere instalar xclip
```bash
function mkt(){
    mkdir {nmap,content,exploits,scripts}
}
```
