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

echo "Enter the number of months you want to play"
read monthNumber
month=0

for((month=0; month<monthNumber; month++))
do
	monthCheck=0
	for((monthCheck=0; monthCheck<monthNumber; monthCheck++))
	do
		echo "Do you want to continue same input for 20 days or want to change it"
		echo "For same press 1"
		echo "Different input for each day press 2"
		read input

		if(($input==1))
		then
        	echo "Which do you want to choose for $monthNumber months:"
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
				echo "--------------------------------"
       			echo "money for day $day is $ $money"
        		totalMoneyWon+=( "$money" )
				echo "--------------------------------"

				if(($money>100))
				then
					dayWon+=( "$day" )
				elif(($money<100))
				then
					dayLoss+=( "$day")
				fi
				totalMoneyWon+=( "$money" )

				echo "----------------------------"
				echo "----------------------------"
				for i in ${dayWon[@]}
				do
					echo "^^^^^^^^^^^^^^^^^^"
               		echo "winning day is $i"
					echo "^^^^^^^^^^^^^^^^^^"
        			echo "my luckiest day is $i"
				done

		    	for i in ${dayLoss[@]}
        		do
					echo "^^^^^^^^^^^^^^^^^^"
        			echo "lossing day is $i"
					echo "^^^^^^^^^^^^^^^^^^"
					echo "my unclucky day is $i"
        		done
				echo "----------------------------"
				echo "----------------------------"

			else
        		echo "enter the correct input out of two"
        		exit
			fi
		done

		elif(($input==2))
		then
			totalDays=21
			for((day=1; day<totalDays; day++))
			do
				echo "which do you want to choose $monthNumber month"
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
					echo "--------------------------------"
       				echo "money for day $day is $ $money"
					echo "--------------------------------"
        			totalMoneyWon+=( "$money" )

					if(($money>100))
					then
						dayWon+=( "$day" )
					elif(($money<100))
					then
						dayLoss+=( "$day")
					fi
					totalMoneyWon+=( "$money" )

					echo "----------------------------"
					echo "----------------------------"
					for i in ${dayWon[@]}
					do
                		echo "winning day is $i"
        			done

		        	for i in ${dayLoss[@]}
        			do
        				echo "lossing day is $i"
        			done
					echo "----------------------------"
					echo "----------------------------"

				else
        			echo "enter the correct input out of two"
        			exit
				fi
			done
		else
			echo "enter the correct input out of 2"
		fi
		sum=0

		for i in ${totalMoneyWon[@]}
		do
    		sum=`expr $sum + $i`
		done
		if(($sum > 2000))
		then
			echo "You won for the month"
			echo "You have $ $sum "
			echo "Your next wish"
			echo "Do you want to play press 1 else press any key to quit"
			read play

			if(($play==1))
			then
				continue
			else
				break
			fi
		fi

		betDays=`expr 20 \* $monthNumber`
		betDollars=`expr 2000 \* $monthNumber`
		echo "-----------------------------------------------"
		echo "total money won after playing 20 days is $ $sum for $monthNumber months"
		echo "-----------------------------------------------"
		echo "you bet $betDollars"

		if(( $sum < $bet_dollars))
		then
			moneyLoss=`expr $betDollars - $sum `
			echo "Total money loss in $betDays days is $ $moneyLoss"
			echo "Your are in loss for $monthNumber months"
		else
			exit
		fi
	done
done

