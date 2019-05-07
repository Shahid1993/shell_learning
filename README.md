# shell_learning
Learning bash/shell scripting

## [Watch Folder...](https://askubuntu.com/questions/893019/monitor-folder-and-run-command-if-there-is-a-file-there)
  - __Using inotifywait__
    ```shell
    sudo apt-get install intotify-tools
    ```
  - __Increase max watched folder count__
    ```shell
    echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
    ```



## License

MIT

## More Resources

- [Monitor folder and run command if there is a file there?](https://askubuntu.com/questions/893019/monitor-folder-and-run-command-if-there-is-a-file-there) 
