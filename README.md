# stuff-classifier

A library for classifying text into multiple categories.

Currently provided classifiers:

- a [naive bayes classifier](http://en.wikipedia.org/wiki/Naive_Bayes_classifier)
- a classifier based on [tf-idf weights](http://en.wikipedia.org/wiki/Tf%E2%80%93idf)

Ran a benchmark of 1345 items that I have previously manually
classified with multiple categories. Here's the rate over which the 2
algorithms have correctly detected one of those categories:

- Bayes: 79.26%
- Tf-Idf: 81.34%

I prefer the Naive Bayes approach, because while having lower stats on
this benchmark, it seems to make better decisions than I did in many
cases. For example, an item with title *"Paintball Session, 100 Balls
and Equipment"* was classified as *"Activities"* by me, but the bayes
classifier identified it as *"Sports"*, at which point I had an
intellectual orgasm. Also, the Tf-Idf classifier seems to do better on
clear-cut cases, but doesn't seem to handle uncertainty so well. Of
course, these are just quick tests I made and I have no idea which is
really better.

## Install

```bash
gem install stuff-classifier
```

## Usage

You either instantiate one class or the other. Both have the same
signature:

```ruby
require 'stuff-classifier'

# for the naive bayes implementation
cls = StuffClassifier::Bayes.new("Cats or Dogs")

# for the Tf-Idf based implementation
cls = StuffClassifier::TfIdf.new("Cats or Dogs")
```

Training the classifier:

```ruby
cls.train(:dog, "Dogs are awesome, cats too. I love my dog")
cls.train(:cat, "Cats are more preferred by software developers. I never could stand cats. I have a dog")    
cls.train(:dog, "My dog's name is Willy. He likes to play with my wife's cat all day long. I love dogs")
cls.train(:cat, "Cats are difficult animals, unlike dogs, really annoying, I hate them all")
cls.train(:dog, "So which one should you choose? A dog, definitely.")
cls.train(:cat, "The favorite food for cats is bird meat, although mice are good, but birds are a delicacy")
cls.train(:dog, "A dog will eat anything, including birds or whatever meat")
cls.train(:cat, "My cat's favorite place to purr is on my keyboard")
cls.train(:dog, "My dog's favorite place to take a leak is the tree in front of our house")
```

And finally, classifying stuff:

```ruby
cls.classify("This test is about cats.")
#=> :cat
cls.classify("I hate ...")
#=> :cat
cls.classify("The most annoying animal on earth.")
#=> :cat
cls.classify("The preferred company of software developers.")
#=> :cat
cls.classify("My precious, my favorite!")
#=> :cat
cls.classify("Get off my keyboard!")
#=> :cat
cls.classify("Kill that bird!")
#=> :cat

cls.classify("This test is about dogs.")
#=> :dog
cls.classify("Cats or Dogs?") 
#=> :dog
cls.classify("What pet will I love more?")    
#=> :dog
cls.classify("Willy, where the heck are you?")
#=> :dog
cls.classify("I like big buts and I cannot lie.") 
#=> :dog
cls.classify("Why is the front door of our house open?")
#=> :dog
cls.classify("Who is eating my meat?")
#=> :dog
```

## TODO

- provide more implementations
- plugable storage mechanism (in-memory, on disk, database)

## License

MIT Licensed. See LICENSE.txt for details.


