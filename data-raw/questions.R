## code to prepare `questions` dataset goes here

questions <- list(
  list(
    id = 1,
    text = "Které z následujících tvrzení představuje vědecky platný argument?",
    background = NULL,
    image = NULL,
    options = list(
      a = "Letošní hodnoty výšky hladiny moře u pobřeží Mexického zálivu jsou nižší než obvykle; měsíční průměrná hodnota byla v některých oblastech téměř o 0,1 cm nižší, než je běžné. Tato fakta dokazují, že zvyšování hladiny moří není problém.",
      b = "Kmen myší byl geneticky upraven tak, aby postrádal určitý gen, a myši nebyly schopny se rozmnožovat. Opětovným zavedením genu do mutantních myší se jejich schopnost reprodukce obnovila. Tato fakta naznačují, že gen je pro reprodukci myší nezbytný.",
      c = "Průzkum ukázal, že se 34 % Američanů domnívá, že dinosauři a předci moderních lidí existovali na Zemi současně, protože fosilní stopy obou druhů byly nalezeny na stejném místě. Tento rozšířený názor je vhodným důkazem pro podporu tvrzení, že se lidé nevyvinuli z opičích předků.",
      d = "Letošní zima přinesla na severovýchodě USA rekordní sněhové srážky a průměrné měsíční teploty byly v některých oblastech o více než 1 °C nižší než obvykle. Tato fakta naznačují, že dochází ke změně klimatu."
    ),
    answer = "b"
  ),
  list(
    id = 2,
    text = "Při pěstování zeleniny na vaší zahrádce jste si všimli zvláštního druhu hmyzu, který požírá vaše rostliny. V průběhu času jste přibližně spočítali počet populací hmyzu (viz údaje níže). Který graf nejlépe zobrazuje vaše údaje?",
    background = "<table style='text-align: center;'>
    <tr>
        <th>Čas (dny)</th>
        <th style='padding: 10px;'>Populace hmyzu (počet)</th>
    </tr>
    <tr>
        <td>2</td>
        <td>7</td>
    </tr>
    <tr>
        <td>4</td>
        <td>16</td>
    </tr>
    <tr>
        <td>8</td>
        <td>60</td>
    </tr>
    <tr>
        <td>10</td>
        <td>123</td>
    </tr>
</table>",
    image = "q2.png",
    options = list(
      a = "",
      b = "",
      c = "",
      d = ""
    ),
     answer = "c"
  ),
 list(
    id = 3,
    text = "Ve Spojených státech byla s využitím náhodného souboru 1000 osob provedena studie, která měla určit průměrný věk dožití. V tomto souboru byla průměrná délka života 80,1 let u žen a 74,9 let u mužů. Jakým způsobem můžete zvýšit svou jistotu, že ženy v celkové populaci Spojených států žijí skutečně déle než muži?",
    background = NULL,
    image = NULL,
    options = list(
      a = "Odečtením průměrného věku dožití mužů od průměrného věku dožití žen. Pokud je hodnota kladná, ženy žijí déle.",
      b = "Provedením statistické analýzy s cílem zjistit, zda ženy žijí významně déle než muži.",
      c = "Vynesením průměrné (střední) hodnoty věku dožití pro ženy a muže do grafu a vizuální analýzou dat",
      d = "Neexistuje způsob, jak zvýšit svou jistotu, že mezi oběma pohlavími existuje rozdíl v průměrném věku dožití."
    ),
     answer = "b"
  )
)

usethis::use_data(questions, overwrite = TRUE)
