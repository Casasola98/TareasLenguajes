(*Jose Daniel Gomez Casasola  2016095929 *)
(*Orlando Hidalgo Ramírez  2016106829 *)

fun is_older (fecha1: int*int*int, fecha2: int*int*int)=
    if((#1 fecha1) < (#1 fecha2)) then
        true
    else if ((#1 fecha1) = (#1 fecha2)) then
        if((#2 fecha1) < (#2 fecha2)) then
            true
        else if ((#2 fecha1) = (#2 fecha2)) then
            if((#3 fecha1) < (#3 fecha2)) then
                true
            else 
                false
        else 
            false
    else 
        false

fun number_in_month(dateList: (int*int*int) list, month:int)=
        let fun aux_number_in_month(dateList: (int*int*int) list)=
                if null dateList then
                    0
                else if(#2 (hd dateList) = month) then
                    1 + aux_number_in_month(tl dateList)
                else
                    aux_number_in_month(tl dateList)
        in
            aux_number_in_month(dateList)
        end

fun number_in_months (dateList: (int*int*int) list,monthList:int list)=
        if null monthList then
            0
        else
            number_in_month(dateList,hd monthList) + number_in_months(dateList,tl monthList)

fun dates_in_month(dateList: (int*int*int) list, month:int)=
        let fun aux_dates_in_month(dateList: (int*int*int) list)=
                if null dateList then
                    []
                else if(#2 (hd dateList) = month) then
                    hd dateList::aux_dates_in_month(tl dateList)
                else
                    aux_dates_in_month(tl dateList)
        in
            aux_dates_in_month(dateList)
        end

fun dates_in_months (dateList: (int*int*int) list,monthList:int list)=
        if null monthList then
            []
        else
            dates_in_month(dateList,hd monthList)@dates_in_months(dateList,tl monthList)

fun get_nth(stringList: string list, index:int)=
        let fun aux_get_nth(stringList: (string) list, counter)=
                if null stringList then
                    ""
                else if(counter = index) then
                    hd stringList
                else
                    aux_get_nth(tl stringList, counter+1)
        in
            aux_get_nth(stringList, 1)
        end

fun date_to_string (fecha1: int*int*int)=    
    get_nth(["January","February","March","April","May","June","July","August","September","October","November","December"], #2 fecha1) ^ " " ^ Int.toString(#3 fecha1) ^ ", " ^ Int.toString(#1 fecha1)

fun number_before_reaching_sum(sum: int, xlist: int list)=
    let fun aux_number_before_reaching_sum(curSum: int, curN: int, xlist: int list)=
            if null xlist then
              curN
            else if (curSum+ hd xlist)>=sum then
              curN
            else
              aux_number_before_reaching_sum(curSum+ hd xlist,curN + 1, tl xlist)
    in
        aux_number_before_reaching_sum(0,0,xlist)
    end

fun what_month(day : int)=
    number_before_reaching_sum(day,[31,29,31,30,31,30,31,31,30,31,30,31]) + 1


val test1 = is_older ((1,2,3),(2,3,4));

val test2 = number_in_month ([(2012,2,28),(2013,12,1)],2);

val test3 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]);

val test4 = dates_in_month ([(2012,2,28),(2013,12,1)],2);

val test5 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]);

val test6 = get_nth (["hi", "there", "how", "are", "you"], 2);

val test7 = date_to_string (2013, 6, 1);

val test8 = number_before_reaching_sum (10, [1,2,3,4,5]);

val test9 = what_month(70);





