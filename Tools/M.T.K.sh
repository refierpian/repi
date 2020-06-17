htng.sh
#!bin/bash
#Encoding UTF-8
#Kalkulator Matematika
clear
loop=false
soal(){
    acak=$[ ($RANDOM % 3 ) + 1 ]
    angka1=$[ ( $RANDOM % 10 )  + 16 ]
    angka2=$[ ( $RANDOM % 10 )  + 1 ]
    kerangka_soal=("+"
                   "-"
                   "*"
                   "/")
    data_soal="$angka1${kerangka_soal[$acak]}$angka2"

    if [[ $acak == [0-2] ]]; then
        printf "Hitunglah hasil dari $data_soal\nHasil : "; read jawab
        let jawaban=$angka1${kerangka_soal[$acak]}$angka2
    elif [ $acak == "3" ]; then
        printf "Hitunglah hasil dari $data_soal\nInput HARUS ditambahkan .00, misal 1.00\nHasil : "; read jawab                                                                          jawaban=$(bc -l <<< "scale=2; $angka1/$angka2")
        if [[ $jawaban == "."[0-9][0-9] ]]; then
            jawaban="0$jawaban"
        fi
    else
        printf "Error!\n"
    fi

    if [[ $jawab ==  $jawaban ]]; then
        printf "\nJawaban Benar!\n"
    else
        printf "\n\nSayangnya jawaban anda salah, Jawaban yang benar adalah $jawaban\n"
    fi

    sleep 2
    printf "Ingin Lanjut?(y/n) : "; read ragu
    if [[ $ragu == "y" || $ragu == "Y" ]]; then
        printf "Oke Lanjut!"
        soal
    elif [[ $ragu == "n" || $ragu == "N" ]]; then
        printf "Okelah kalau tidak mau lanjut!\nIngin Ke Menu atau Keluar?(m/k) : "; read ragu2
        if [[ $ragu2 == "m" || $ragu2 == "M" ]]; then
            menu
        elif [[ $ragu2 == "k" || $ragu2 == "K" ]]; then
            exit 1
        fi
    fi
}
pembagian(){
    let hasil=$1/$2
    printf "Hasil Dari $1 : $2 adalah $hasil\n\n"
}
prekalian(){
    let hasil=$1*$2
    printf "Hasil Dari $1 x $2 adalah $hasil\n\n"
}
pengurangan(){
    let hasil=$1-$2
    printf "Hasil Dari $1 - $2 adalah $hasil\n\n"
}
penjumlahan(){
    let hasil=$1+$2
    printf "Hasil Dari $1 + $2 adalah $hasil\n\n"
}
menu(){
    if [[ $loop == false ]]; then
        clear
        loop=true
    fi
    printf "Pilih yang mana?\n[1] Penjumlahan\n[2] Pengurangan\n[3] Perkalian\n[4] Pembagian\n[5] Soal\n[6] Keluar\nPilihan : "; read pilihan
    if [[ $pilihan == [1-4] ]]; then
        printf "Masukkan Angka Pertama : "; read angka1
        printf "Masukkan Angka Kedua   : "; read angka2
    fi

    if [ $pilihan == "1" ]; then
        penjumlahan angka1 angka2
    elif [ $pilihan == "2" ]; then
        pengurangan angka1 angka2
    elif [ $pilihan == "3" ]; then
        perkalian angka1 angka2
    elif [ $pilihan == "4" ]; then
        pembagian angka1 angka2
    elif [ $pilihan == "5" ]; then
        soal
    elif [ $pilihan == "6" ]; then
        printf "Menghentikan Program...\n\n"
        sleep 1
        exit 1
    else
        printf "Input Salah!!"
    fi
    printf "Lanjut Menghitung?(y/n) : "; read ragu
    if [[ $ragu == "y" || $ragu == "Y" ]]; then
            printf "Oke Lanjut!"
            menu
        elif [[ $ragu == "n" || $ragu == "N" ]]; then
            printf "Okelah kalau tidak mau lanjut!\n"
            exit 1
        fi
}

menu

#Mungkin Masih Ada Bug
