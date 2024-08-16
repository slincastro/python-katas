### Python Exploration Commands

1. **`type()`**
   - **Purpose**: Returns the type of the object or variable.
   - **Usage**: `type(variable)`
   - **Example**:
     ```python
     x = [1, 2, 3]
     print(type(x))  # <class 'list'>
     ```

2. **`help()`**
   - **Purpose**: Displays the documentation for an object, module, class, or function.
   - **Usage**: `help(variable)` or `help(class.function)`
   - **Example**:
     ```python
     help(len)  # Shows documentation for the len() function
     ```

3. **`vars()`**
   - **Purpose**: Returns the `__dict__`, a dictionary containing the object's attributes.
   - **Usage**: `vars(variable)`
   - **Example**:
     ```python
     class Person:
         def __init__(self, name, age):
             self.name = name
             self.age = age

     p = Person("John", 30)
     print(vars(p))  # {'name': 'John', 'age': 30}
     ```

4. **`id()`**
   - **Purpose**: Returns the unique identifier of an object in memory (its memory address).
   - **Usage**: `id(variable)`
   - **Example**:
     ```python
     x = 10
     print(id(x))  # Shows the memory ID of the object 10
     ```

5. **`isinstance()`**
   - **Purpose**: Checks if an object is an instance of a class or a tuple of classes.
   - **Usage**: `isinstance(object, class)`
   - **Example**:
     ```python
     x = [1, 2, 3]
     print(isinstance(x, list))  # True
     ```

6. **`hasattr()`**
   - **Purpose**: Checks if an object has an attribute with a given name.
   - **Usage**: `hasattr(object, 'attribute_name')`
   - **Example**:
     ```python
     class Cat:
         def __init__(self, name):
             self.name = name

     c = Cat("Whiskers")
     print(hasattr(c, 'name'))  # True
     print(hasattr(c, 'age'))  # False
     ```

7. **`getattr()`**
   - **Purpose**: Gets the value of an object's attribute. If the attribute doesn't exist, it can return a default value.
   - **Usage**: `getattr(object, 'attribute_name', default_value)`
   - **Example**:
     ```python
     class Cat:
         def __init__(self, name):
             self.name = name

     c = Cat("Whiskers")
     print(getattr(c, 'name'))  # "Whiskers"
     print(getattr(c, 'age', 2))  # 2, because 'age' doesn't exist
     ```

8. **`setattr()`**
   - **Purpose**: Sets the value of an object's attribute.
   - **Usage**: `setattr(object, 'attribute_name', value)`
   - **Example**:
     ```python
     class Dog:
         pass

     d = Dog()
     setattr(d, 'name', 'Rex')
     print(d.name)  # Rex
     ```

9. **`callable()`**
   - **Purpose**: Checks if an object is callable (i.e., can be called as a function).
   - **Usage**: `callable(object)`
   - **Example**:
     ```python
     def my_function():
         pass

     print(callable(my_function))  # True
     print(callable(5))  # False
     ```

10. **`len()`**
    - **Purpose**: Returns the length (number of elements) of an object, such as a list, string, tuple, etc.
    - **Usage**: `len(variable)`
    - **Example**:
      ```python
      lst = [1, 2, 3]
      print(len(lst))  # 3
      ```

