terraform graph > graph.dot
cat /etc/os-release
yum install graphviz
cat graph.dot # this will display the file
cat graph.dot | dot -Tsvg > graph.svg # this will convert the dot file into a image file


cat /etc/os-release