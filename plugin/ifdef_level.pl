#!/usr/bin/env perl
###############################################################################
###############################################################################
use strict;
use warnings;
use utf8;

main(@ARGV);

###############################################################################
sub main {
    my $input_file = shift(@_);
    my $output_file = shift(@_);

    my @classify_array;

    my ($IN_FILE_PTR, $OUT_FILE_PTR) = openInOutFile( $input_file, $output_file );

    parseIfDef( \@classify_array, $IN_FILE_PTR , $OUT_FILE_PTR);

    print2Darray(\@classify_array, $OUT_FILE_PTR);

    print $OUT_FILE_PTR "\nvim:tw=78:ft=c:fdm=syntax:\n";
    close ( $OUT_FILE_PTR );
    # `vim -c ":set nomore |:args $output_file | argdo execute \"normal gg=G\" | update" -c ":q";`
}
###############################################################################
sub print2Darray{
    my ($a_2d_array_ref, $OUT_FILE_PTR) = @_;
    my @a_2d_array = @{$a_2d_array_ref};

    my $last_quotient=-1;
    my $row_size = $#a_2d_array + 1;
    # my $cul_size = scalar @{ $a_2d_array[0] };

    my ($i, $j);
    for ( $i=0 ; $i<$row_size ; $i++){
        #######################################
        # for ( $j=0 ; $j<$cul_size; $j++){
        #     print $OUT_FILE_PTR "$a_2d_array[$i][$j] ";
        # }
        #######################################
        # $a_2d_array[$i][0] : line number
        # $a_2d_array[$i][1] : brackets
        # $a_2d_array[$i][2] : Name
        printCentesimal( $a_2d_array[$i][0], \$last_quotient, $OUT_FILE_PTR); #line number
        printf $OUT_FILE_PTR "%s%3d %s\n", $a_2d_array[$i][1], $a_2d_array[$i][0], $a_2d_array[$i][2];
    }
}
###############################################################################
sub printCentesimal {
    my $line_num = shift; #line number
    my $last_quotient_ref = shift; # ${$last_quotient_ref}
    my $OUT_FILE_PTR = shift;
    my $last_quotient = ${$last_quotient_ref};

    my $this_quotient = int($line_num/100);
    if ( $this_quotient != $last_quotient ) {
        printf $OUT_FILE_PTR "%d\n", int($this_quotient*100);
    }
    ${$last_quotient_ref} = $this_quotient;

}
###############################################################################

use constant{
    IF => 0,
    ELSIF => 1,
    ELSE => 2,
    ENDIF => 3,

};

sub initTypeToBrackets{
    my $typeToBrackets_ref = shift;
    ${$typeToBrackets_ref}[IF]="{";
    ${$typeToBrackets_ref}[ELSIF]="|";
    ${$typeToBrackets_ref}[ELSE]="|";
    ${$typeToBrackets_ref}[ENDIF]="}";

}
###############################################################################

sub parseIfDef {
    my $classify_array_ref = shift(@_);
    my $input_file_ptr = shift(@_);
    my $OUT_FILE_PTR = shift(@_);

    my $line_num = 0;
    my @matchs = ();
    my $ifdef_cnt = 0;
    my $matchs_str;

    my @tail;

    my @params;
    my @typeToBrackets;

    initTypeToBrackets(\@typeToBrackets);

    while (my $line = <$input_file_ptr>) {
        
        $line_num++;
        @tail = ();
        @params = ();

        chomp $line;

        if ( @matchs = $line =~ /^\s*# *if(n?)def +(\w+)/){

            $matchs_str = arrayToStrWithoutSpace(\@matchs);
            push @params, ( \$line_num, \$typeToBrackets[IF], \$matchs_str);

            classifyToArray( $classify_array_ref, $ifdef_cnt, \@params);
            $ifdef_cnt++;
        }
        elsif( @matchs = $line =~ /^\s*# *if(\W+)defined(\W+)(\w+)(.*$)?/ ){

            getTailArray(\@tail, pop @matchs);
            push @matchs,@tail;

            $matchs_str = arrayToStrWithoutSpace(\@matchs);
            push @params, ( \$line_num, \$typeToBrackets[IF], \$matchs_str);
            classifyToArray( $classify_array_ref, $ifdef_cnt, \@params);
            $ifdef_cnt++;
        }
        elsif( @matchs = $line =~ /^\s*# *elif(\W+)(\w+)(.*$)?/ ){

            getTailArray(\@tail, pop @matchs);
            push @matchs,@tail;

            $matchs_str = arrayToStrWithoutSpace(\@matchs);
            push @params, ( \$line_num, \$typeToBrackets[ELSIF], \$matchs_str);
            classifyToArray( $classify_array_ref, $ifdef_cnt, \@params);
            $ifdef_cnt++;
        }        
        elsif ( @matchs = $line =~ /^\s*# *(else)/ ) {

            $matchs_str = arrayToStrWithoutSpace(\@matchs);
            push @params, ( \$line_num, \$typeToBrackets[ELSE], \$matchs_str);
            classifyToArray( $classify_array_ref, $ifdef_cnt, \@params);
            $ifdef_cnt++;

        }
        elsif ( @matchs = $line =~ /^\s*# *(endif)/ ) {

            $matchs_str = arrayToStrWithoutSpace(\@matchs);
            push @params, ( \$line_num, \$typeToBrackets[ENDIF], \$matchs_str);
            classifyToArray( $classify_array_ref, $ifdef_cnt, \@params);
            $ifdef_cnt++;

        }
        
    }


}
###############################################################################
sub arrayToStrWithoutSpace{

    my $matchs_ref = shift(@_);
    my @matchs = @{$matchs_ref};
    my $matchs_str = join('', @matchs);
    $matchs_str =~ s/\s+//g;

    return $matchs_str;
}
###############################################################################

sub getTailArray{
    my ($tail_ref, $tail_str) = @_;
    my @tail_matchs;
    # my @tail= @{$tail_ref};


    while ( $tail_str =~ /^\s*(\W+)(.*$)?/ ){

        if( @tail_matchs = $tail_str =~ /^\s*(\W+)defined(\W+)(\w+)(.*$)?/ ) {

            $tail_str = pop @tail_matchs;
            push @{$tail_ref}, @tail_matchs;
            getTailArray($tail_ref, $tail_str);

        } else {

            push @{$tail_ref},$tail_str;
            $tail_str = "";
        }

    }
}
###############################################################################
            # classifyToArray( $classify_array_ref, $ifdef_cnt, \@params);
sub classifyToArray{

   my ($classify_array_ref, $ifdef_cnt, $params_ref) = @_; 

   my @params = @{$params_ref};
   my $params_num = ($#params)+1;

   my $i;
   for ( $i=0 ; $i<$params_num ; $i++)
   {
        ${$classify_array_ref}[$ifdef_cnt][$i]=${$params[$i]};
   }

   
}

###############################################################################
sub openInOutFile {

    my $input_file = shift;
    my $output_file = shift;

    # if ( -e $output_file ) { `rm -rf $output_file`; }
    my $OUT_FILE_PTR;

    unless(open $OUT_FILE_PTR, '>:encoding(UTF-8)', $output_file) {
        die "\nUnable to create $output_file\n";
    }


    open(my $IN_FILE_PRT, '<:encoding(UTF-8)', $input_file)
      or die print $OUT_FILE_PTR "Unable to open $input_file\n";
    

    return ( $IN_FILE_PRT, $OUT_FILE_PTR);

}
###############################################################################
