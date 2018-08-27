### COMPILAÇÃO CONDICIONAL

Até agora, vimos como utilizar condições para definir fluxos alternativos de uma aplicação. Essas condições são avaliadas **em tempo de execução**, pelo Runtime do .NET Framework/.NET Core.

O que vamos ver agora é uma categoria especial de condições da linguagem C#, que não são usadas durante o tempo de execução, mas para definir **qual código** deve ser incluído nos pacotes (assemblies) da sua aplicação, durante o **tempo de compilação** do aplicativo.

No exame 70-483, você poderá encontrar algumas questões com esses casos especiais de condições. Essas questões irão apresentar problemas chamados de **compilação condicional**.

##### #if, #else, #elif, #endif

Vamos começar com um programa bem simples, que imprime no console uma mensagem indicando se o programa foi compilado com modo **debug** ou modo **release**:

![](https://lh4.googleusercontent.com/10uDKltn-wnndcqGERED4ljsEADukP1dZsl20MVNyn7Gc-Z8lgkAYyoPGRoCMhFa16dl5BWvCCtRLBbI546dGnZdATl2NNoQFkxQsLhSt1SAvd18V81rQ3MdlfnZmtuxd5J2mGWV)

Note que estamos usando uma constante **DEBUG** para indicar que o modo de compilação é **debug**.

Se você precisar compilar o código em release, basta mudar o valor da constante **DEBUG** para **false**.

![](https://lh5.googleusercontent.com/I3Sr2Vs1FU-z2pk-X8nqRCHcJPrON1fPjtzr61on-hk0_ISL0qEc4OXNGM7wb8vmBDzKaVn6onXwOVOKVmh0S7aXsgTKwzM_KNs-Plo-EYgerybX9v33pF0DUSb06Uh-GhZv3zgy)

Mas existe um problema aqui: sempre que formos mudar o modo de compilação, precisamos mexer no valor da constante. Seria melhor fazer isso automaticamente, detectando o modo de compilação sem precisar usar uma constante.

Vamos fazer algumas alterações para permitir a detecção do modo de compilação:

1.  vamos comentar a constante **DEBUG** no nosso código

2.  vamos adicionar um símbolo hash "#" antes do **if** e do **else**

3.  vamos adicionar uma instrução #**endif** ao final do **if**

![](https://lh3.googleusercontent.com/9bHj-e9_jF008sS6OLKUl8dM3jFy0UlTl9epf2S17xwUWoh_XXxMbETc9uRBb77IvVco5fU_d9lbPYW8D3Gw4ilkEmHIKoVm4kOABGhLKQAXnu8xSM4GEUjOEHyxDIJSAi7AEDff)

O que aconteceu aqui? qual a diferença entre um **if e else** e um #**if** e #**else**?

-   if e else definem o fluxo da aplicação em **tempo de execução**

-   #if, #else e #endif definem **quais trechos de código** devem ser incluídos na compilação

Mas se comentamos a constante **DEBUG** no nosso código, como conseguimos compilar sem erro?

Vamos descobrir isso entrando nas propriedades do projeto (teclando ALT+ENTER):

![](https://lh6.googleusercontent.com/oPwdHpRtGrvd3RE1Opafvd6Em6kVLEa4pICIdqielsn3k0rlxbw4uAccPT2aykvu5oJUwcwYvCk2U7-kcw9bSYI1AJkjkusQ13OL098I9X_D5VXGHZcNEmwGC5OCeYn4tSW5syCO)

Entramos agora na guia Build:

![](https://lh5.googleusercontent.com/nVdoI2KyROLDB8WTN-mflh2dClZk0LQ1C2w03GCK3AqK0Jcpdo1VY2Tbhch07py8l2mh-g9JqX-AGgduemXCCFMrkdSG9mBlX9qApfqOuKJ4w-Qo1UwLhoTQtGq8nrCOOYv2bXti)

Lá dentro da página de propriedades, veremos uma configuração indicando uma **constante de compilação** que é adicionada ao programa automaticamente:

![](https://lh6.googleusercontent.com/bF7NAX_-aosOauWDKBxMhpRo0wxI8EBifRISfah4Q1K73XZjX6mgwg4H4VPHp5g3J5aDlU8Yjn4ZXuMGq6DrEup8XjPfd_vyPChUcEGfB7G7Xq9Ny4GYGEIjOz7LsqTJX2RKuASY)

Como podemos ver, o projeto está configurado para **definir uma constante chamada DEBUG**. Note que essa constante é um **símbolo de compilação**, que não está disponível para o runtime  do .NET, mas apenas para o compilador C#. É importante notar que if é uma **instrução**, enquanto #if e #endif são **diretivas**, isto é, apenas delimitam trechos de código que podem ou não serem incluídos na compilação.

De forma similar, se você mudar a compilação para Release, uma outra constante, **RELEASE**, será incluída no lugar de **DEBUG**.

Para demonstrar como o compilador do C# compila esse código, vamos adicionar esse código no site **sharplab.io**:

<https://sharplab.io/#v2:CYLg1APgrgzglgOwOYAIDKBPGAXApgWwG4BYAKAAcoAjAGzgGMV6aBDGGFAWUQAsWBhVu1xkA3mRSSUlWgxQA3APZxgXXFE65si4IoAUASglTxpKeZQBiOADMUegCIBRAEIBVAOJGzF3/0UIMIo0uAB0AOoATnB4ADKIuHoARABquJEwAMeKKM7uHkkGJD6+lrg0MCIlvlL+gcFhUTG48QiJqelZOQBKTrFOAIJoToXFNVa4CMC2xpIAvmQLpGRAA===>

![](https://lh5.googleusercontent.com/DBU8SDVwLJTivQIYN_Se08EnSjj7KCLdbrh4_Q_Hz0sdj_CXxT-geMsitE2A4QkpcLZy5qQxo92gYO0eMNKBsTqvW3ytxgbC_x6k7M7ci6qN3LTO0atAuK5JkeW7ADyHjJQ75Mfg)

Agora veja na aba da direita, como o compilador incluiu somente a primeira instrução `Console.WriteLine`:

![](https://lh6.googleusercontent.com/qSOjEgIPOWSF6j4B7xlq_2U-lziHwbSEYANkwZMK9L2W3GIbgD9z47xBPygz_m9pOHOEelqdIPm3R0dSiEdTww7eFZFKNPsa0PZvwwFn2xY4yZPtDTS2rzMe8ONjitn9zihp0-RN)

Na mesma página, vamos mudar o modo de compilação para Release:

![](https://lh6.googleusercontent.com/2y2xH0kGWU2eqevLo2VdZyz3H_fMudd-UfPoA9Iq_ysVTlYLk8oCk_3VlQuUQqo18jz6wvqqsX5IxMmund9geHxfNG3uOBRhJXaTwSN_9Fd9h2hWgulzpIdpEEFkTmXQcUpYzuz6)

Automaticamente o código gerado muda para incluir somente a segunda instrução `Console.WriteLine("Versão RELEASE");`:

![](https://lh6.googleusercontent.com/oauzKhFVO6xKfFieBZ0Zdw6elj_ytdiMDcnWyUjg5woMuH0PLVGjeZ14OCExKdAV4UBaOVnoA8CAUE9xN4pPMgvuIeo0hqvzmE_mksCXzZostPE2gZgzdAgC-H6Mszl873nFYgsZ)

Mas você pode estar se perguntando: **por que usar compilação condicional**?

Por vários motivos. Você pode, por exemplo, querer gerar logs em arquivos ou banco de dados em seu **ambiente de testes** (com opção de DEBUG), para diagnosticar possíveis problemas com o código ou com a infraestrutura. Mas ao mesmo tempo em que esses logs são úteis em testes, eles acabam **afetando a performance** da aplicação. Por isso, você não quer que esse código não seja enviado para o ambiente de produção, onde o código é compilado com modo **RELEASE**. Esse é só um dos motivos para querermos usar compilação condicional.