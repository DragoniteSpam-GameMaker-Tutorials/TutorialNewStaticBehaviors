
function Animal() constructor {
    self.name = "Animal";
    
    static Vocalize = function() {
        show_debug_message("*generic animal noises*");
    };
}

function Dog() : Animal() constructor {
    self.name = "Dog";
    
    static Vocalize = function() {
        show_debug_message("bark, bark");
    };
}

function Dinosaur() : Animal() constructor {
    self.name = "Dinosaur";
    
    static Vocalize = function() {
        show_debug_message("*chomp*");
    };
}

var sparky = new Dog();
var littlefoot = new Dinosaur();

sparky.Vocalize();
littlefoot.Vocalize();

show_debug_message("Sparky is a dog? {0}", is_instanceof(sparky, Dog));
show_debug_message("Sparky is a dinosaur? {0}", is_instanceof(sparky, Dinosaur));
show_debug_message("Littlefoot is an animal? {0}", is_instanceof(sparky, Animal));

show_debug_message("Sparky's data: {0}", sparky);
var dog_static_data = static_get(sparky);
show_debug_message("Sparky's static data: {0}", dog_static_data);

dog_static_data.Vocalize = function() {
    show_debug_message("woof, woof");
};

sparky.Vocalize();

var chase = new Dog();

chase.Vocalize();

chase.Vocalize = function() {
    show_debug_message("yap, yap!");
};

show_debug_message("Chase now says:");
chase.Vocalize();
show_debug_message("Sparky now says:");
sparky.Vocalize();




show_debug_message("--------------");
show_debug_message("Littlefoot is a: {0}", instanceof(littlefoot));
littlefoot.Vocalize();
static_set(littlefoot, dog_static_data);
show_debug_message("Littlefoot is a: {0}", instanceof(littlefoot));
littlefoot.Vocalize();

var anonymous_data = { };
show_debug_message("The anonymous data's type is: {0}", instanceof(anonymous_data));
static_set(anonymous_data, dog_static_data);
show_debug_message("The anonymous data's type is: {0}", instanceof(anonymous_data));
anonymous_data.Vocalize();


show_debug_message();
show_debug_message();
show_debug_message();
show_debug_message("--------------");


function Player() constructor {
    self.health = 10;
    self.level = 1;
    
    static LevelUp = function() {
        self.level++;
    };
}


var me = new Player();
show_debug_message(me);
me.LevelUp();
show_debug_message(me);

var saved_data = json_stringify(me);
show_debug_message(saved_data);



var static_player_data = static_get(new Player());


var struct_loaded_from_a_file_or_something = json_parse(saved_data);
show_debug_message(struct_loaded_from_a_file_or_something);
static_set(struct_loaded_from_a_file_or_something, static_player_data);
struct_loaded_from_a_file_or_something.LevelUp();
show_debug_message(struct_loaded_from_a_file_or_something);
show_debug_message("type of the deserialized data: {0}", instanceof(struct_loaded_from_a_file_or_something));


game_end();