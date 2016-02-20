# rails-test-6
#### Person
```
Name
Age
Gender
```

#### Assume:
```
Father: John Fwz
Mother: Lily Fwz
Son:
  - William Fwz
  - Michael Fwz
Daughter:
  - Ava Fwz
  - Mia Fwz
```
The system must be provide these functions:
```
john.first_name => "John"
john.name => "John Fwz"
william.parents => [john, lily]
william.father => john
william.mother => lily
john.say_something => "Hello, my name is John Fwz."
william.father.say_something => "Hello, I am your father."
william.mother.say_something => "Hello, I am your mother."
lily.sons => [william, michael]
lily.children => [william, michael, ava, mia]
lily.daughters => [ava, mia]
lily.daughters.first.say_something = "Hello, I am your daughter."
william.brothers => [michael]
john.father_of?(mia) => true
john.age => 40
william.age => 18
john.older_than(william) => 22
```
Ensure:
```
Age > 0
Must over 20 to be a father
Must over 18 to be a mother
A person has only one father, mother
Father, Son, Brother are male
Mother, Daughter are female
Searchable by full name
```

# Rails-test-7
### 1/
```
john.wife => lily
lily.husband => john
```

### 2/
```
John's friends: Jack(Male), Jason(Male)
Jack's friends: Mina(Female), Mason(Male), Jason(Male)
```
The system must be provide these functions:
```
john.friends => [jack, jason]
john.friends_of_friends => [mason, john, mina]
john.mutual_friends(jack) => [jason]
```

### 3/
```
Sofia's father: John
Sofia's mother: Mina
```
The system must be provide these functions:
```
sofia.father => john
sofia.mother => mina
sofia.mother_in_law => lily (system auto detect)
```


