// Has to be imported wherever acronyms are used
#import "acronyms.typ": ac,acl,acs,acsp,acp,aclp,acronyms

= This chapter is included from another file <chap:useful-guides>

Let's see in @lst:hellew-wörld how nicely syntax highlighting works in #link("https://typst.app", "Typst").\
I really like it!

#figure(
    caption: "Rust sample",
)[
    #set par(leading: 0.75em)
    #set align(left) // We really don't want our code to be centered line by line...
```rust
fn main() {
    println!("Hello, world!");
}
```
]<lst:hellew-wörld>

Awesome, isn't it? \
Well, if you're coming from a nice Markdown editor, there is nothing new with it, but in comparison to L#super(size: 0.8em,baseline: -0.2em)[A]T#sub(size: 0.8em, baseline: 0.2em)[E]X? No extra package required!
\ \
By the way, do you like @harry?

= Test <chap:test>