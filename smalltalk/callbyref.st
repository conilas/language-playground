 Object subclass: #Account.
   Account instanceVariableNames: 'balance'.
   
 Object subclass: #Mutator.
   Mutator instanceVariableNames: 'account'.

Account extend [
       set: amount [
        balance := amount
       ]
       printOn: stream [
            <category: 'printing'>
            super printOn: stream.
            stream nextPutAll: ' with balance: '.
            balance printOn: stream
        ]
   ]
   
Mutator extend [
        set: acc [
         account := acc
        ]
        update: value [
            account set: value
        ]
]
   
value := Account new.
value set: 20.

value print.

mutator := Mutator new.
mutator set: value.
mutator update: 40.

value print.
