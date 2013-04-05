Firewater - a ruby implementation of the Firebase framework

Firebase is a real-time backend that allows one to store key-value pairs in a hierarchical fashion, without
having to manage additional servers. Get the firehose from http://firebase.com

---

## Requirements

- Ruby >= 1.9
- Map
- Typhoeus

## Getting Started

$ gem install firewater

## Usage

### Setup your Firebase

Signup for a free firebase account and create a new firebase for your account.
In the following code sample we will use the following as you firebase url:

+ https://www.firewater.firebaseio.com


### Populating firebase

Firebase supports the following data types:

+ String
+ Number
+ Boolean
+ Array
+ Hash

---
#### Adding primitive types

```ruby
ref = Firewater::Firebase.new( 'https://firewater.firebaseio.com' )
data = {
  a: 0,
  b: %s(Hello World),
  c: 10.5
}
ref.set( data )
```

Yields:

+ a:0
+ b:"Hello World"
+ c:10.5

NOTE: Set is a destructive operation and will replace the previous content for the reference it is
called from.

Thus 

```ruby
ref = Firewater::Firebase.new( 'https://firewater.firebaseio.com' )
data = {
  a: 0
}
ref.set( data )
```

Yields
+ a:0

Hence replacing the previously assigned content.

---
#### Adding arrays

```ruby
ref = Firewater::Firebase.new( 'https://firewater.firebaseio.com' )
ref.set( %w(Hello World) )
```

Yields:

+ 0:"Hello"
+ 1:"World"

---
#### Adding arrays (ordered data)

The preferred method to construct list in your firebase is to use the push operation, which
will automatically provide ordering to your list.

```ruby
ref = Firewater::Firebase.new( 'https://firewater.firebaseio.com' )
ref.push( "BumbleBee" )
ref.push( "Tuna" )
```

Yields:
  
+ -IrMr3Yp1mozVNzDePKy: "BumbleBee"
+ -IrMr3cM6XjTpNebsYRh: "Tuna"

NOTE: The list index will be autogenerated by firebase to ensure correct ordering on retrieval.

---
#### Adding hashes

```ruby
ref = Firewater::Firebase.new( 'https://firewater.firebaseio.com' )
data = {
  a: {
    a_1: %s(Hello World),    
    a_2: 10.5    
  },
  b: {
    b_1: 10,
    b_2: true
  }
}
ref.set( data )
```

Yields:

+ a:
  + a_1:"Hello World"
  + a_2_:10.5
+ b:
  + b_1:10
  + b_2:true
    
    
### Updating data

```ruby
c_ref = ref.child( 'a' ).update( c:2 )
c_ref = ref.child( 'a' ).update( b:fred )
```

## Contact

Fernand Galiana

- http://github.com/derailed
- http://twitter.com/kitesurfer
- <fernand.galiana@gmail.com>

## License

Firewater is released under the [MIT](http://opensource.org/licenses/MIT) license.