#Cours 11-09-2017 Philippe Massicotte
#VECTOR 1D
x <- 10
x <-c(1,4,6,7,8)
y <- c("This", "is" ,"a", "vector")
x <-c(1, "2", -3, "pi")
class (xx)
class (y)
class (z)

x[3]

x<- c(1,3,5,1)
y<- c(3,1)
x+y

x<- c(1,3,5,1)
y<- c(3,1,2)
x+y #Warning!!


#MATRIX 2D
set.seed(1234)
A<- matrix(data=sample(25), nrow=5, ncol=5)
A
A[m,n] # [ligne, colonne]
A[3,1] # 24
A[3,] # retourne moi la ligne 3
A[,1] # retourne moi la colonne 1
A[10] #retourne le 10e valeur, compte par colonne
A [, -1] # SUPPRIME la première colonne

# MISSING VALUES
x<- c(1,2,3,NA,5) 
x+1
is.na(x) # fonction qui détermine où se trouve les NA s'il y en a
any(is.na(x)) #Y a t il au moins une valeurs de NA?
mean(x) # NA
#DIRE a R quoi faire avec les NA
mean(x, na.rm=TRUE)

1<0
x <- c(1,2,3,4,5,6)
x>4  #[1] FALSE FALSE FALSE FALSE  TRUE  TRUE
x!=4   #[1]  TRUE  TRUE  TRUE FALSE  TRUE  TRUE
0 == FALSE
1 == TRUE

# ! indique inverse de ____

"HI"== "hi" # FALSE
"A" < "B" #TRUE

#FUNCTION
mean(rnorm(10))

add(1,2,3)
add(x=1,y=2,z=3)

my_function <- function(x, y, z) {
  result <- x+y+z
return (result)
}
my_function(1,2,3)


if (TRUE) { "This will be executed"}

if (TRUE) { 
  "This will be executed"
} else {
    "Otherwise, this will be executed"
  }

##exemple
if (1>3) {
  print ("A")
} else {print ("B")
}

ifelse (test =pi <3, yes="A", no="B")

# LOOPS
 # for loop or while loop

#For on connait a l'avance cimbien de fois on va executer la boucle

for (counter in vector) {
  #Stuff to do here
}

for (i in 1:5) {
  print (i)
}

for (i in c("A", "B", "C")) {
  print (i)
}


set.seed(1234)
vec <-rnorm(100)
hist(vec)

res <-0

for(i in vec){
  res <- res + i
}

sum(vec) # devrait me donner -15.67617

res / length(vec) # Somme de tou les élément du vecteur vec par la boucle for / longueur du vectuer vec
length (vec)




