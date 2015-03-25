<?php



for($i=0,$r=5;$i<72;$i++,$r+=5){
    exec("convert -rotate $r p0.png t{$i}.png"); 
}
