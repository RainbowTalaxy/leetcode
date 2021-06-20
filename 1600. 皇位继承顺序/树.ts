class Person {
  name: string
  isDead: boolean = false
  childs: Person[] = []

  constructor(name: string) {
      this.name = name
  }

  getSuccessor(): string[] {
      let result: string[] = []
      if (!this.isDead) {
          result.push(this.name)
      }
      for (const child of this.childs) {
          result.push(...child.getSuccessor())
      }
      return result
  }
}

class ThroneInheritance {
  dict: Map<string, Person> = new Map()
  king: Person

  constructor(kingName: string) {
      this.king = new Person(kingName)
      this.dict.set(kingName, this.king)
  }

  birth(parentName: string, childName: string): void {
      let parent = this.dict.get(parentName)
      let child = new Person(childName)
      parent.childs.push(child)
      this.dict.set(childName, child)
  }

  death(name: string): void {
      this.dict.get(name).isDead = true
  }

  getInheritanceOrder(): string[] {
      return this.king.getSuccessor()
  }
}