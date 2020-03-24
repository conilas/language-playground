//from https://pdfs.semanticscholar.org/f2b2/8191102f553fa4095fb4b8a07d8eed4bd259.pdf
const head = (values) => values[0]
const tail = (values) => values.slice(1)

const rememberuptolast_ret = (comp, list) => {
  const fn = (values) => (kont) => {
    if (values.length == 0) return kont()
    
    return fn(tail(values))(() => comp == head(values) ? tail(values) : kont())
  }
  
  return fn(list)(() => list)
}
