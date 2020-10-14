## Socket Programming

## Instruction on running:

- Compile the `.c` files using `gcc`.  
  `$ gcc $file.c -o $binary`

- First, run the `recvfile` binary (`./recvfile`) to start the server.

- Then, run the `sendfile` binary (`./sendfile`) along with the filepath
  and the IP address. For example:  
  `./sendfile ../foo 127.0.0.1`

- At this point, you'd have sent the file "foo" from the client's side
  and would have been very well receieved by the server.

## Author

Utkarsh Gupta <<utkarsh@debian.org>> (A2305217557)
