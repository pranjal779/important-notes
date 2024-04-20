import yaml

things = input("Enter three values separated by commas: ")
things = things.strip().split(',')  # Split input string into a list
data = {'main': {'sub': things}}     # Assign the list directly
print(yaml.safe_dump(data, sort_keys=False))
