//from https://pdfs.semanticscholar.org/f2b2/8191102f553fa4095fb4b8a07d8eed4bd259.pdf
const head = (values) => values[0]
const tail = (values) => values.slice(1)

const rememberuptolast_ret = (comp, list) => {
  const fn = (values) => (kont) => {
    if (values.length == 0) return kont()
    
    fn(tail(values))(() => comp == head(values) ? console.log(tail(values)) : kont())
  }
  
  fn(list)(() => console.log(list))
}

/**
example: 
rememberuptolast_ret(42, [0,1,2,42,3,4,42,5])
stack (sorta): 
fn([0,1,2,42,3,4,42,5], () => [0,1,2,42,3,4,42,5])
-> fn([1,2,42,3,4,42,5], () => [0,1,2,42,3,4,42,5])
--> fn([2,42,3,4,42,5], () => [0,1,2,42,3,4,42,5]) 
---> fn ([42,3,4,42,5], () => [0,1,2,42,3,4,42,5])
----> fn ([3,4,42,5], () => [3,4,42,5])
-----> fn ([4,42,5], () => [3,4,42,5])
------> fn ([42,5], () => [3,4,42,5])
-------> fn ([5], () => [5])
--------> fn ([], () => [5])
---------> [5]
**/
