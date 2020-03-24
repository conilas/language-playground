//from https://pdfs.semanticscholar.org/f2b2/8191102f553fa4095fb4b8a07d8eed4bd259.pdf
const rememberuptolast_ret = (comp, list) => {
  const fn = (values) => (kont) => {
    if (values.length == 0) return kont()
    
    return fn(values.slice(1))(() => comp == values[0] ? values.slice(1) : kont())
  }
  
  return fn(list)(() => list)
}
