%Fixed-point integer square root.
%Note: fixed-point shift MUST be an even number.
function root=sqrt_fixed(value)
    root=0;
    rem=0;
    shift=36;
    if mod(shift,2) ~= 0
        error('Shift must be an even number.');
    end
    
    width=2+shift;
    count=shift;
    
    value_fixed=value;
    
%     for i=0:15
%         root=bitshift(root,1)+1;
%         rem=bitshift(rem,width-shift)+bitshift(value_fixed,-shift);
%         
%         value_fixed=bitand(bitshift(value_fixed,2),2^width-1);
%         
%         if(root<=rem)
%             rem=rem-root;
%             root=root+1;
%         else
%             root=root-1;
%         end
%     end
%     root=bitshift(root,-1);
    
    while(count>=0)
        root=bitshift(root,1);
        rem=bitshift(rem,width-shift)+bitshift(value_fixed,-shift);
        
        value_fixed=bitand(bitshift(value_fixed,2),2^width-1);
        
        divisor=bitshift(root,1)+1;
        if(divisor<=rem)
            rem=rem-divisor;
            root=root+1;
        end
        
        count=count-1;
    end
    
    root=bitshift(root,-(shift/2));
    
    disp(sprintf('root=%d (truth=%f, diff=%e)',root,sqrt(value),root-sqrt(value)));
end