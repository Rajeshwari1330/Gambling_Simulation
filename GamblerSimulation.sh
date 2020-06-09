#!/bin/bash -x
echo "Welcome to Gambling Simulation Problem ...!!!"

function flip()
{
	result=$((RANDOM%2 + 1))
	if(($result==1))
	then
    	echo "OUTPUT IS HEAD"
        add=1;
	elif(($result==2))
	then
        echo "OUTPUT IS TAIL"
        sub=1;
	fi
}

echo "Do you want to continue same input for 20 days or want to change it"
echo "For same input press 1"
echo "Different input for each day press 2"
read input
if(($input==1))
then
	echo "Which do you want to choose:"
    echo "---------------"
    echo "1.HEAD"
    echo "2.TAIL"
    read user

	echo "Till how much percentage of the amount you want to play?"
    read stakeAmount
	totalDays=21

	for((day=1; day<totalDays; day++))
	do
		echo "----------DAY $day -------------"

		if(($user == 1 || $user ==2))
		then
        	headIncrement=1
        	tailIncrement=1
        	money=100

			echo "I have $ 100 with me"
        	bet=0
        	echo "I will bet $ 1 now"

			while(($money != 200 || $money != 0))
        	do
            	flip
               	if(($result==1))
                then
                	echo "won $headIncrement time"
                    money=`expr $money + $add`
                    echo "money is $ $money"
                    headIncrement=`expr $headIncrement + 1`
                elif(($result==2))
                then
                	echo "won $tailIncrement time"
                    money=`expr $money - $sub`
                    echo "money is $ $money"
                    tailIncrement=`expr $tailIncrement + 1`
                fi

		        winAmount=`expr $stakeAmount + 100`
                lossAmount=`expr 100 - $stakeAmount`
                bet=`expr $bet + 1`
                echo "number of bet is $bet"

                if(($money == $winAmount))
                then
                	echo "won $ $winAmount for $ $stakeAmount %"
                    break
                elif(($money == $lossAmount))
                then
                	echo "lost $ $lossAmount for $ $stakeAmount %"
                    break
                fi
        		done
				echo "--------------------------------"
       			echo "money for day $day is $ $money"
        		totalMoneyWon+=( "$money" )
				echo "--------------------------------"
				else
        			echo "Enter the correct input out of two"
        	exit
		fi
	done

	elif(($input==2))
	then
	totalDays=21
	for((day=1; day<totalDays; day++))
	do
		echo "Which do you want to choose:"
        echo "---------------"
        echo "1.HEAD"
        echo "2.TAIL"
        read user

		echo "Till how much percentage of the amount you want to play?"
        read stakeAmount
		echo "----------DAY $day -------------"

		if(($user == 1 || $user ==2))
		then
        	headIncrement=1
        	tailIncrement=1
        	money=100
        	echo "I have $ 100 with me"
        	bet=0
        	echo "I will bet $ 1 now"
        	while(($money != 200 || $money != 0))
        	do
            	flip
                if(($result==1))
                then
                	echo "won $headIncrement time"
                   	money=`expr $money + $add`
                   	echo "money is $ $money"
                    headIncrement=`expr $headIncrement + 1`
                elif(($result==2))
                then
                	echo "won $tailIncrement time"
                    money=`expr $money - $sub`
                    echo "money is $ $money"
                    tailIncrement=`expr $tailIncrement + 1`
                fi

		        winAmount=`expr $stakeAmount + 100`
                lossAmount=`expr 100 - $stakeAmount`
                bet=`expr $bet + 1`
                echo "number of bet is $bet"

                if(($money == $winAmount))
                then
                	echo "won $ $winAmount for $ $stakeAmount %"
                	break
                elif(($money == $lossAmount))
                then
                	echo "lost $ $lossAmount for $ $stakeAmount %"
                    break
                fi
        	done
			echo "--------------------------------"
       		echo "money for day $day is $ $money"
			echo "--------------------------------"
        	totalMoneyWon+=( "$money" )

		else
        	echo "Enter the correct input out of two"
        	exit
		fi
	done
else
	echo "Enter the correct input out of 2"
fi
sum=0

for i in ${totalMoneyWon[@]}
do
    sum=`expr $sum + $i`
done
echo "-----------------------------------------------"
echo "Total money won after playing 20 days is $ $sum"
echo "---------------------------------------------"
echo "you bet $ 2000"
if(($sum<2000))
then
	moneyLoss=`expr 2000 - $sum `
	echo "Total money loss in 20 days is $ $moneyLoss"
	echo "Your are in loss"
else
	exit
fi




