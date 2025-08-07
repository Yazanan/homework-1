<?php

trait A {
    public function name($name) {
        $this->name = $name;
        echo "From A: " . $this->name . "\n";
    }
}

trait B {
    public function name() {
        echo "From B: Hi, I am Yazan\n";
    }
}

class User {
    public $name;

    use A, B {
        A::name insteadof B;     
        B::name as nameFromB;    
    }
}

$user1 = new User();
$user1->name("yazan");        
$user1->nameFromB();      