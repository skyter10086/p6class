use v6;

# enum FieldType  <INT NUM VCHAR CHAR TEXT >;

subset FieldType of Str where * (elem) < INT NUM VCHAR CHAR TEXT BOOL DATE>;

subset DatePattern of Str where * (elem) < YMD MDY >;

subset DateSepSymbol of Str where * (elem) < - / >; # * 表示 each ， (elem) 表示存在与后面的数组元素中

#enum DatePattern < YMD MDY >;

#enum DateSepSymbol < - / >;

subset DatePrecision of List where (DatePattern, DateSepSymbol);

subset NumPrecision of List where (Int, Int);

role Field {
    has Str $.name;
    has FieldType $.type;
    has $.precision;
    has Bool $.primary = False;

    
}

class IntField does Field {
    
   
    submethod BUILD(:$!name,  Int:D :$!precision, :$!primary = False) {
        $!type = 'INT';
        
    }

}


class CharField does Field {

    submethod BUILD(:$!name,  Int:D :$!precision, :$!primary = False) {
        $!type = 'CHAR';
        
    }

}

class TextField does Field {

    submethod BUILD(:$!name,  Int:D :$!precision, :$!primary = False) {
        $!type = 'TEXT';
        
    }
}

class BoolField does Field {

    submethod BUILD(:$!name,  Int:D :$!precision, :$!primary = False) {
        $!type = 'BOOL';
        
    }
}

class VCharField does Field {

    submethod BUILD(:$!name,  Int:D :$!precision, :$!primary = False) {
        $!type = 'VCHAR';
        
    }
}

class NumField does Field {

    submethod BUILD(:$!name,  NumPrecision:D :$!precision, :$!primary = False) {
        $!type = 'NUM';
        
    }
}

class DateField does Field {

    submethod BUILD(:$!name, DatePrecision:D :$!precision,  :$!primary = False) {
        $!type = 'INT';
        
    }
}


my $f = Field.new(name => 'name', type => 'CHAR', precision => 20);
my $i = IntField.new(:name('salary'), :precision(8),);
say $i;

say $f.perl;

my $d = DateField.new:  # 调用方法不用括号可以写成 func: params; 的格式
                       :name('birth'),
                       :precision(<YMD  - >); # Pair 也就是Hash 也可以这么写 :Key(Value)
                                              # List 可以写成 < elem1 elem2> 的格式 以空格分隔个元素,
                                              #  无需引号。
say $d.precision[1];

 my DatePrecision $dp = ('YMD', '-' );


 say $dp.WHAT;

 my @ar := ('YMD' , '/');

 say @ar.WHAT;

# ? List  与 Array 、 Sequence 的 联系与区别 

=begin pod 
List : 基本容器，储存多个值，长度不可变。
Array : List 的一种 长度可变。
Sequence : List 的一种 拥有无限长度 ，通常是一个迭代器 ，可以实现惰性列表。
=end pod


role Table {

}
