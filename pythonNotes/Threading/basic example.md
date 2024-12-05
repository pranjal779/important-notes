```py
import threading
# Define a function to run in a separate thread
def print_numbers():
    for i in range(5):
        print(i)
# Create a thread
thread = threading.Thread(target=print_numbers)
# Start the thread
thread.start()
# Wait for the thread to finish
thread.join()
print("Thread has completed.")
```

#### output:
0  
1  
2  
3  
4  
Thread has completed.  
