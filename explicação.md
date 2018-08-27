# OPERADORES E EXPRESSÕES

![](https://raw.githubusercontent.com/alura-cursos/certificacao-csharp-pt4/master/Imagens/01.operadores-expressoes/img1.png)

O bom entendimento das **expressões** é fundamental não só para criação de de condições com **if**, mas outras construções de decisões, como as instruções **switch-case, while e do while**, que veremos mais adiante no curso.

Diferente de outras linguagens, na linguagem C# a expressão da condição **if** sempre deve retornar um booleano. Portanto, a expressão abaixo é inválida e gera um erro de compilação:

![](https://raw.githubusercontent.com/alura-cursos/certificacao-csharp-pt4/master/Imagens/01.operadores-expressoes/img2.png)

##### OPERADORES RELACIONAIS

Um operador relacional irá comparar dois operandos (por exemplo, duas variáveis) e retornar um valor booleano com o resultado da comparação.

Podemos comparar a igualdade, por exemplo:

![](https://raw.githubusercontent.com/alura-cursos/certificacao-csharp-pt4/master/Imagens/01.operadores-expressoes/img3.png)

Mas note que o os operadores de igualdade podem ter significado diferente, dependendo do tipo de dado: Se o tipo for **tipo de valor** (inteiro, booleano, char), então a igualdade se dará pelo valor. Se o tipo for **tipo de referência**, então duas instâncias diferentes serão comparadas em sua identidade como **diferentes**, mesmo que contenham os mesmos valores.

Os valores numéricos podem ter suas grandezas comparadas com operadores **maior e menor**.

![](https://raw.githubusercontent.com/alura-cursos/certificacao-csharp-pt4/master/Imagens/01.operadores-expressoes/img4.png)

Você pode ainda testar o **tipo do dado**, para saber não apenas de um tipo específico mas também **se ele pode ser convertido** para um tipo mais básico (genérico), como uma classe base ou interface.

![](https://raw.githubusercontent.com/alura-cursos/certificacao-csharp-pt4/master/Imagens/01.operadores-expressoes/img5.png)

![](https://raw.githubusercontent.com/alura-cursos/certificacao-csharp-pt4/master/Imagens/01.operadores-expressoes/img6.png)

##### OPERADOR NOT
 
Muitas vezes é necessário testar não se uma condição é verdadeira, **mas se ela é falsa**. Para isso, usamos o **OPERADOR NOT (!)**:

![](https://raw.githubusercontent.com/alura-cursos/certificacao-csharp-pt4/master/Imagens/01.operadores-expressoes/img7.png)

E se tivermos também uma instrução **else**? Nesse caso, temos que inverter a ordem dos blocos **then** e **else** que seriam usados caso a expressão fosse verdadeira, para que o programa fique correto:

![](https://raw.githubusercontent.com/alura-cursos/certificacao-csharp-pt4/master/Imagens/01.operadores-expressoes/img8.png)

##### OPERADORES LÓGICOS: O OPERADOR “AND” (&&)

Vamos dar uma olhada no operador de comparação simples, **“maior ou igual”**:

![](https://raw.githubusercontent.com/alura-cursos/certificacao-csharp-pt4/master/Imagens/01.operadores-expressoes/img9.png)

No exame 70-483, você terá que lidar com expressões mais complexas do que essa, que envolvem combinações de expressões mais simples. Por exemplo:

![](https://raw.githubusercontent.com/alura-cursos/certificacao-csharp-pt4/master/Imagens/01.operadores-expressoes/img10.png)

Como podemos interpretar essa expressão? 

**“Se m1 for maior ou igual a n1 E 
m1 for maior ou igual a p1”**

O operador AND (&&) combina 2 expressões menores em uma expressão maior, e só retorna verdadeiro se as duas expressões-filhas forem **verdadeiras**.

Mas vamos ver como o runtime do .NET interpreta essa expressão como expressões menores:

1) Primeiro, o *runtime* avalia a **primeira expressão**, em destaque:

![](https://raw.githubusercontent.com/alura-cursos/certificacao-csharp-pt4/master/Imagens/01.operadores-expressoes/img11.png)

1.1) Se a expressão for **falsa**, a expressão retorna **falso**, sem que a segunda expressão seja avaliada.

1.2) Se a expressão for **verdadeira**, o runtime do .NET irá avaliar a segunda expressão.

![](https://raw.githubusercontent.com/alura-cursos/certificacao-csharp-pt4/master/Imagens/01.operadores-expressoes/img12.png)

1.3) O operador AND (&&) só retorna verdadeiro se as duas expressões-filhas forem **verdadeiras**

Note que, se a primeira expressão for **falsa**, a segunda expressão nem é avaliada. Essa característica se chama **curto-circuito do operador AND**.

##### OPERADORES LÓGICOS: O OPERADOR “OR” ( || )

![](https://raw.githubusercontent.com/alura-cursos/certificacao-csharp-pt4/master/Imagens/01.operadores-expressoes/img13.png)

Como podemos interpretar essa expressão? 

**“Se m1 for maior que n1 OU 
m1 for maior que p1”**

O operador OR ( || ) combina 2 expressões menores em uma expressão maior, e só retorna verdadeiro se **pelo menos uma** das duas expressões-filhas for **verdadeira**.

Mas vamos ver como o runtime do .NET interpreta essa expressão como expressões menores:

1) Primeiro, o *runtime* avalia a **primeira expressão**, em destaque:

![](https://raw.githubusercontent.com/alura-cursos/certificacao-csharp-pt4/master/Imagens/01.operadores-expressoes/img14.png)

1.1) Se a expressão for **verdadeira**, a expressão retorna **verdadeiro**, sem que a segunda expressão seja avaliada.

1.2) Se a expressão for **falsa**, o *runtime* do .NET irá avaliar a segunda expressão.

![](https://raw.githubusercontent.com/alura-cursos/certificacao-csharp-pt4/master/Imagens/01.operadores-expressoes/img15.png)

1.3) O operador OR ( || ) só retorna verdadeiro se **pelo menos uma** das duas expressões-filhas for **verdadeira**

Note que, se a primeira expressão for **verdadeira**, a segunda expressão nem é avaliada. Essa característica se chama **curto-circuito do operador OR**.

##### PARA SABER MAIS

***Consulte a documentação da Microsoft sobre operadores C#:***
https://docs.microsoft.com/pt-br/dotnet/csharp/language-reference/operators/index



