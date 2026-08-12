from fizzbuzz import fizzbuzz


def test_normal_number():
    assert fizzbuzz(1) == "1"


def test_fizz():
    assert fizzbuzz(3) == "Fizz"


def test_buzz():
    assert fizzbuzz(5) == "Buzz"


def test_fizzbuzz():
    assert fizzbuzz(15) == "FizzBuzz"
