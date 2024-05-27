Find if a given number is an armstrong number

```sql
declare
	userip number;
	len number;
	tempLen number;
	temp number :=0 ;
	lastDigit number;
	tempUserIp number;
begin
	
    userip:= 153;
    
    tempUserIp:=userip;
    len:= length(userip);
    tempLen:=len;

    WHILE len>0 LOOP
        lastDigit:= mod(userip,10);
        temp:= temp+ lastDigit**tempLen;
        len:= len-1;
        userip:= floor(userip/10);
        
    END LOOP;

    IF temp = tempUserIp THEN
        DBMS_OUTPUT.PUT_LINE(temp || ' is an armstrong number');
    END IF;

end;
/
```
Find the armstrong number within 0 to 999

```sql
declare
	userip number;
	len number;
	tempLen number;
	temp number :=0 ;
	lastDigit number;
	tempUserIp number;
begin
    FOR i IN 0..999 LOOP
    	
        userip:= i;
		temp:=0;		-- important
    	tempUserIp:=userip;
    	len:= length(userip);
    	tempLen:=len;
    
    	WHILE len>0 LOOP
            lastDigit:= mod(userip,10);
    		temp:= temp+ lastDigit**tempLen;
    		len:= len-1;
    		userip:= floor(userip/10);
    		
    	END LOOP;
    
    	IF temp = tempUserIp THEN
            DBMS_OUTPUT.PUT_LINE(i);
    	END IF;
	END LOOP;
end;
/ 
```

Factorial

```sql
declare
	userip number;
	ans number ;
	
begin	
    userip:= 3;
	ans:=1;

    WHILE userip>1 LOOP
        ans := ans * userip;
		userip:=userip-1;     
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(ans);

end;
/
```

Prime number

```sql
declare
    c number;		
begin	

    FOR i in 2..100 LOOP
       c:=2;
	   WHILE c*c <= i LOOP
           IF mod(i,c) =0 THEN
           		EXIT;
			END IF;
			c:=c+1;
		END LOOP;
		IF mod(i,c) <> 0 THEN
         	DBMS_OUTPUT.PUT_LINE(i);  		
		END IF;
	END LOOP;
end;
/
```

Leap Year

```sql
declare
    year number;
		
begin	

    year := 1900;

	IF mod(year,4)<>0 OR (mod(year,100) = 0 AND mod(year,400) <> 0)
    THEN
        DBMS_OUTPUT.PUT_LINE('Not Leap year');
	ELSE
        DBMS_OUTPUT.PUT_LINE('Leap year');
	END IF;
end;
/
```

String Reverse

```sql
declare
    ipStr VARCHAR(10);
	ans VARCHAR(10);
	len number;
begin	

    ipStr := 'hmmmm';
	len:= LENGTH(ipStr);
	ans:='';
	WHILE len>0 LOOP
       ans:= ans || substr(ipStr,len,1);
	   len:=len-1;
	
	END LOOP;

	DBMS_OUTPUT.PUT_LINE(ans);
END;
	
/
```

Fibonacci , db manipulation.


