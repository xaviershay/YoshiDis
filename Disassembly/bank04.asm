org $048000

; shy guy state 05
    TYX                 ; $048000   |
    RTS                 ; $048001   |

.init_melon
    JSL $02A007         ; $048002   |
    STZ $7902,x         ; $048006   |
    LDA $70E2,x         ; $048009   |
    CLC                 ; $04800C   |
    ADC #$0008          ; $04800D   |
    STA $3010           ; $048010   |
    LDA $7182,x         ; $048013   |
    CLC                 ; $048016   |
    ADC #$0010          ; $048017   |
    STA $3000           ; $04801A   |
    LDX #$0A            ; $04801D   |
    LDA #$CE2F          ; $04801F   |
    JSL $7EDE91         ; $048022   | GSU init
    LDX $12             ; $048026   |
    LDA $300E           ; $048028   |
    AND #$0003          ; $04802B   |
    BNE CODE_048066     ; $04802E   |
    RTL                 ; $048030   |

.main_melon
    JSL $03AF23         ; $048031   |
    LDA $7360,x         ; $048035   |
    CMP #$0005          ; $048038   |
    BNE CODE_048041     ; $04803B   |
    JSL $048131         ; $04803D   |

CODE_048041:
    LDA $7542,x         ; $048041   |
    BNE CODE_04809D     ; $048044   |
    LDY $7D36,x         ; $048046   |
    DEY                 ; $048049   |
    BMI CODE_04809C     ; $04804A   |
    LDA $6F00,y         ; $04804C   |
    CMP #$0010          ; $04804F   |
    BNE CODE_04809C     ; $048052   |
    LDA $7D38,y         ; $048054   |
    BEQ CODE_04809C     ; $048057   |
    TYX                 ; $048059   |
    JSL $03B25B         ; $04805A   |
    LDX $12             ; $04805E   |
    LDA #$FD00          ; $048060   |
    STA $7222,x         ; $048063   |

CODE_048066:
    LDA $6FA0,x         ; $048066   |
    AND #$F9FF          ; $048069   |
    ORA #$0220          ; $04806C   |
    STA $6FA0,x         ; $04806F   |
    LDA $6FA2,x         ; $048072   |
    ORA #$0001          ; $048075   |
    STA $6FA2,x         ; $048078   |
    LDA $7040,x         ; $04807B   |
    ORA #$0004          ; $04807E   |
    STA $7040,x         ; $048081   |
    LDA #$0005          ; $048084   |
    STA $74A2,x         ; $048087   |
    LDA $7042,x         ; $04808A   |
    AND #$00CF          ; $04808D   |
    ORA #$0020          ; $048090   |
    STA $7042,x         ; $048093   |
    LDA #$0040          ; $048096   |
    STA $7542,x         ; $048099   |

CODE_04809C:
    RTL                 ; $04809C   |

CODE_04809D:
    LDA $7860,x         ; $04809D   |
    AND #$0001          ; $0480A0   |
    BEQ CODE_0480BF     ; $0480A3   |
    JSL $03A590         ; $0480A5   |
    LDA $7222,x         ; $0480A9   |
    BMI CODE_0480BC     ; $0480AC   |
    CMP #$0200          ; $0480AE   |
    BCC CODE_0480BC     ; $0480B1   |
    LSR A               ; $0480B3   |
    EOR #$FFFF          ; $0480B4   |
    STA $7222,x         ; $0480B7   |
    BRA CODE_0480BF     ; $0480BA   |

CODE_0480BC:
    STZ $7222,x         ; $0480BC   |

CODE_0480BF:
    LDY $18,x           ; $0480BF   |
    BEQ CODE_0480FC     ; $0480C1   |
    LDA $6F00,y         ; $0480C3   |
    CMP #$0010          ; $0480C6   |
    BNE CODE_0480EB     ; $0480C9   |
    LDA $70E2,y         ; $0480CB   |
    SEC                 ; $0480CE   |
    SBC $70E2,x         ; $0480CF   |
    CLC                 ; $0480D2   |
    ADC #$0010          ; $0480D3   |
    CMP #$0020          ; $0480D6   |
    BCS CODE_0480EB     ; $0480D9   |
    LDA $7182,y         ; $0480DB   |
    SEC                 ; $0480DE   |
    SBC $7182,x         ; $0480DF   |
    CLC                 ; $0480E2   |
    ADC #$001C          ; $0480E3   |
    CMP #$0038          ; $0480E6   |
    BCC CODE_0480FC     ; $0480E9   |

CODE_0480EB:
    LDA #$0000          ; $0480EB   |
    STA $79D8,y         ; $0480EE   |
    STA $7902,y         ; $0480F1   |
    STZ $18,x           ; $0480F4   |
    STZ $7902,x         ; $0480F6   |
    JMP CODE_048066     ; $0480F9   |

CODE_0480FC:
    LDA $76,x           ; $0480FC   |
    BEQ CODE_048130     ; $0480FE   |
    LDY $7D36,x         ; $048100   |
    BPL CODE_048115     ; $048103   |
    JSL $03A858         ; $048105   |
    LDA $7C16,x         ; $048109   |
    ASL A               ; $04810C   |
    ASL A               ; $04810D   |
    ASL A               ; $04810E   |
    ASL A               ; $04810F   |
    STA $7220,x         ; $048110   |
    BRA CODE_048124     ; $048113   |

CODE_048115:
    LDA $7860,x         ; $048115   |
    AND #$0001          ; $048118   |
    BEQ CODE_048130     ; $04811B   |
    LDA #$001F          ; $04811D   |\ play sound #$001F
    JSL $0085D2         ; $048120   |/

CODE_048124:
    LDA #$000E          ; $048124   |
    STA $6F00,x         ; $048127   |
    LDA #$FE00          ; $04812A   |
    STA $7222,x         ; $04812D   |

CODE_048130:
    RTL                 ; $048130   |

; melon sub
    LDA $7A96,x         ; $048131   |
    BNE CODE_0480FC     ; $048134   |
    LDA #$000C          ; $048136   |
    STA $7A96,x         ; $048139   |
    JMP CODE_0403B5     ; $04813C   |

.init_torpedo
    JSL $03AD24         ; $048140   |
    BCS CODE_048149     ; $048144   |
    JMP CODE_0481C0     ; $048146   |

CODE_048149:
    SEP #$20            ; $048149   |
    LDA #$7F            ; $04814B   |
    STA $7863,x         ; $04814D   |
    REP #$20            ; $048150   |
    RTL                 ; $048152   |

DATA_048153:         dw $0000
DATA_048155:         dw $8040
DATA_048157:         dw $8000
DATA_048159:         dw $00C0
DATA_04815B:         dw $8080
DATA_04815D:         dw $0040
DATA_04815F:         dw $0080
DATA_048161:         dw $80C0

DATA_048163:         dw $0200
DATA_048165:         dw $FE00
DATA_048167:         dw $0800
DATA_048169:         dw $F800

.main_torpedo
    JSL $03AA2E         ; $04816B   |
    JSL $03AF23         ; $04816F   |
    INC $16,x           ; $048173   |
    JSL $03A2F8         ; $048175   |
    BCS CODE_0481C4     ; $048179   |
    LDY $7D36,x         ; $04817B   |
    DEY                 ; $04817E   |
    BMI CODE_04819C     ; $04817F   |
    LDA $6FA2,y         ; $048181   |
    AND #$6000          ; $048184   |
    BNE CODE_04819C     ; $048187   |

CODE_048189:
    SEP #$20            ; $048189   |
    LDA $74A0,y         ; $04818B   |
    STA $74A0,x         ; $04818E   |
    REP #$20            ; $048191   |
    TYX                 ; $048193   |
    JSL $03B507         ; $048194   |
    LDX $12             ; $048198   |
    BRA CODE_0481A1     ; $04819A   |

CODE_04819C:
    LDA $7860,x         ; $04819C   |
    BEQ CODE_0481C8     ; $04819F   |

CODE_0481A1:
    LDA #$01C4          ; $0481A1   |
    JSL $008B21         ; $0481A4   |
    LDA $70E2,x         ; $0481A8   |
    STA $70A2,y         ; $0481AB   |
    LDA $7182,x         ; $0481AE   |
    STA $7142,y         ; $0481B1   |
    LDA #$0003          ; $0481B4   |
    STA $7E4C,y         ; $0481B7   |
    LDA #$0002          ; $0481BA   |
    STA $7782,y         ; $0481BD   |

CODE_0481C0:
    JSL $03A31E         ; $0481C0   |

CODE_0481C4:
    STZ $61C4           ; $0481C4   |
    RTL                 ; $0481C7   |

CODE_0481C8:
    LDA $18,x           ; $0481C8   |
    LDY $7400,x         ; $0481CA   |
    BNE CODE_0481D3     ; $0481CD   |
    EOR #$00FF          ; $0481CF   |
    INC A               ; $0481D2   |

CODE_0481D3:
    AND #$01FE          ; $0481D3   |
    STA $00             ; $0481D6   |
    LDY $7862,x         ; $0481D8   |
    BNE CODE_0481E3     ; $0481DB   |
    LDA #$0080          ; $0481DD   |
    JMP CODE_04827F     ; $0481E0   |--

CODE_0481E3:
    LDA $16,x           ; $0481E3   |
    AND #$0007          ; $0481E5   |
    BEQ CODE_0481ED     ; $0481E8   |
    JMP CODE_048290     ; $0481EA   |

CODE_0481ED:
    TXA                 ; $0481ED   |
    STA $6000           ; $0481EE   |
    LDX #$09            ; $0481F1   |
    LDA #$8D5E          ; $0481F3   |
    JSL $7EDE44         ; $0481F6   | GSU init
    LDY $6000           ; $0481FA   |
    BPL CODE_04820C     ; $0481FD   |
    LDX $12             ; $0481FF   |
    LDY #$00            ; $048201   |
    LDA $76,x           ; $048203   |
    BMI CODE_048209     ; $048205   |
    LDY #$02            ; $048207   |

CODE_048209:
    JMP CODE_04828C     ; $048209   |--

CODE_04820C:
    LDY #$00            ; $04820C   |
    LDA $6002           ; $04820E   |
    BPL CODE_048219     ; $048211   |
    LDY #$04            ; $048213   |
    EOR #$FFFF          ; $048215   |
    INC A               ; $048218   |

CODE_048219:
    CMP #$0100          ; $048219   |
    BCS CODE_04828E     ; $04821C   |
    STA $02             ; $04821E   |
    TAX                 ; $048220   |
    LDA $6004           ; $048221   |
    BPL CODE_04822C     ; $048224   |
    INY                 ; $048226   |
    INY                 ; $048227   |
    EOR #$FFFF          ; $048228   |
    INC A               ; $04822B   |

CODE_04822C:
    CMP #$0100          ; $04822C   |
    BCS CODE_04828E     ; $04822F   |
    CMP $02             ; $048231   |
    BCC CODE_048239     ; $048233   |
    INY                 ; $048235   |
    TAX                 ; $048236   |
    LDA $02             ; $048237   |

CODE_048239:
    CPX #$10            ; $048239   |
    BCS CODE_04824D     ; $04823B   |
    LDY $6000           ; $04823D   |
    LDA $6FA0,y         ; $048240   |
    AND #$0200          ; $048243   |
    BEQ CODE_04824D     ; $048246   |
    LDX $12             ; $048248   |
    JMP CODE_048189     ; $04824A   |--

CODE_04824D:
    XBA                 ; $04824D   |
    STA $4204           ; $04824E   |
    STX $4206           ; $048251   |
    TYA                 ; $048254   |
    ASL A               ; $048255   |
    TAY                 ; $048256   |
    NOP                 ; $048257   |
    NOP                 ; $048258   |
    NOP                 ; $048259   |
    NOP                 ; $04825A   |
    REP #$10            ; $04825B   |
    LDA $4214           ; $04825D   |
    ASL A               ; $048260   |
    TAX                 ; $048261   |
    CPX #$0202          ; $048262   |
    BCC CODE_04826A     ; $048265   |
    LDX #$0200          ; $048267   |

CODE_04826A:
    LDA $8153,y         ; $04826A   | table
    ASL A               ; $04826D   |
    STA $02             ; $04826E   |
    LDA $0BB810,x       ; $048270   |
    BCC CODE_04827A     ; $048274   |
    EOR #$FFFF          ; $048276   |
    INC A               ; $048279   |

CODE_04827A:
    CLC                 ; $04827A   |
    ADC $02             ; $04827B   |
    SEP #$10            ; $04827D   |

CODE_04827F:
    SBC $00             ; $04827F   |
    LDY #$00            ; $048281   |
    AND #$0100          ; $048283   |
    BEQ CODE_04828A     ; $048286   |
    LDY #$02            ; $048288   |

CODE_04828A:
    LDX $12             ; $04828A   |

CODE_04828C:
    STY $78,x           ; $04828C   |

CODE_04828E:
    LDX $12             ; $04828E   |

CODE_048290:
    LDY $78,x           ; $048290   |
    LDA $76,x           ; $048292   |
    CMP $8167,y         ; $048294   |
    BEQ CODE_04829F     ; $048297   |
    CLC                 ; $048299   |
    ADC $8163,y         ; $04829A   |
    STA $76,x           ; $04829D   |

CODE_04829F:
    AND #$FF00          ; $04829F   |
    BPL CODE_0482A7     ; $0482A2   |
    ORA #$00FF          ; $0482A4   |

CODE_0482A7:
    XBA                 ; $0482A7   |
    CLC                 ; $0482A8   |
    ADC $00             ; $0482A9   |
    AND #$01FE          ; $0482AB   |
    STA $00             ; $0482AE   |
    SEC                 ; $0482B0   |
    SBC #$0081          ; $0482B1   |
    LDY #$02            ; $0482B4   |
    CMP #$00FF          ; $0482B6   |
    LDA $00             ; $0482B9   |
    BCS CODE_0482C6     ; $0482BB   |
    EOR #$00FF          ; $0482BD   |
    INC A               ; $0482C0   |
    AND #$01FE          ; $0482C1   |
    LDY #$00            ; $0482C4   |

CODE_0482C6:
    STA $18,x           ; $0482C6   |
    PHA                 ; $0482C8   |
    REP #$10            ; $0482C9   |
    TYA                 ; $0482CB   |
    STA $7400,x         ; $0482CC   |
    TXY                 ; $0482CF   |
    LDX $00             ; $0482D0   |
    LDA $00E954,x       ; $0482D2   |
    ASL A               ; $0482D6   |
    ASL A               ; $0482D7   |
    STA $7220,y         ; $0482D8   |
    LDA $00E9D4,x       ; $0482DB   |
    EOR #$FFFF          ; $0482DF   |
    INC A               ; $0482E2   |
    ASL A               ; $0482E3   |
    ASL A               ; $0482E4   |
    STA $7222,y         ; $0482E5   |
    PLA                 ; $0482E8   |
    LSR A               ; $0482E9   |
    STA $300A           ; $0482EA   |
    LDX $7722,y         ; $0482ED   |
    LDA $03A9CE,x       ; $0482F0   |
    STA $3006           ; $0482F4   |
    LDA $03A9EE,x       ; $0482F7   |
    STA $3004           ; $0482FB   |
    LDA #$0100          ; $0482FE   |
    STA $300C           ; $048301   |
    LDY #$30A0          ; $048304   |
    LDA $14             ; $048307   |
    AND #$0002          ; $048309   |
    BEQ CODE_048311     ; $04830C   |
    LDY #$30B0          ; $04830E   |

CODE_048311:
    TYA                 ; $048311   |
    STA $3018           ; $048312   |
    LDA #$0054          ; $048315   |
    STA $301A           ; $048318   |
    SEP #$10            ; $04831B   |
    LDX #$08            ; $04831D   |
    LDA #$867E          ; $04831F   |
    JSL $7EDE44         ; $048322   | GSU init
    INC $0CF9           ; $048326   |
    LDX $12             ; $048329   |
    RTL                 ; $04832B   |

.init_melon_flame
    RTL                 ; $04832C   |

DATA_04832D:         dw $0008
DATA_04832F:         dw $FFF8
DATA_048331:         dw $0008
DATA_048333:         dw $FFF8

DATA_048335:         dw $0008
DATA_048337:         dw $0008
DATA_048339:         dw $FFF8
DATA_04833B:         dw $FFF8

.main_melon_flame
    JSL $03AF23         ; $04833D   |
    REP #$10            ; $048341   |
    LDA $7902,x         ; $048343   |
    TAX                 ; $048346   |
    LDA $700007,x       ; $048347   |
    AND #$00FF          ; $04834B   |
    CMP #$0089          ; $04834E   |
    BNE CODE_04839D     ; $048351   |
    LDA $700006,x       ; $048353   |
    AND #$00FF          ; $048357   |
    ASL A               ; $04835A   |
    TAY                 ; $04835B   |
    LDA $700000,x       ; $04835C   |
    AND #$FFF0          ; $048360   |
    CLC                 ; $048363   |
    ADC $832D,y         ; $048364   | table
    STA $6000           ; $048367   |
    LDA $700002,x       ; $04836A   |
    AND #$FFF0          ; $04836E   |
    CLC                 ; $048371   |
    ADC $8335,y         ; $048372   | table
    STA $6002           ; $048375   |
    JSL $00E01F         ; $048378   |
    SEP #$10            ; $04837C   |
    LDA #$0213          ; $04837E   |
    JSL $008B21         ; $048381   |
    LDA $6000           ; $048385   |
    STA $70A2,y         ; $048388   |
    LDA $6002           ; $04838B   |
    STA $7142,y         ; $04838E   |
    LDA #$0008          ; $048391   |
    STA $73C2,y         ; $048394   |
    LDA #$0004          ; $048397   |
    STA $7782,y         ; $04839A   |

CODE_04839D:
    SEP #$10            ; $04839D   |
    LDX $12             ; $04839F   |
    LDA $7A96,x         ; $0483A1   |
    AND #$0003          ; $0483A4   |
    BNE CODE_0483B8     ; $0483A7   |
    INC $7402,x         ; $0483A9   |
    LDA $7402,x         ; $0483AC   |
    CMP #$0004          ; $0483AF   |
    BCC CODE_0483B8     ; $0483B2   |
    JMP CODE_0403A3     ; $0483B4   |--

CODE_0483B8:
    LDA $7A38,x         ; $0483B8   |
    BNE CODE_048413     ; $0483BB   |
    TXA                 ; $0483BD   |
    STA $3002           ; $0483BE   |
    LDX #$09            ; $0483C1   |
    LDA #$9011          ; $0483C3   |
    JSL $7EDE44         ; $0483C6   | GSU init

CODE_0483CA:
    LDX $12             ; $0483CA   |
    LDY $301C           ; $0483CC   |
    BMI CODE_048412     ; $0483CF   |
    LDA $6F00,y         ; $0483D1   |
    CMP #$0010          ; $0483D4   |
    BNE CODE_0483E1     ; $0483D7   |
    LDA $7040,y         ; $0483D9   |
    AND #$0010          ; $0483DC   |
    BNE CODE_0483EC     ; $0483DF   |

CODE_0483E1:
    LDX #$09            ; $0483E1   |
    LDA $301E           ; $0483E3   |
    JSL $7EDE47         ; $0483E6   | GSU init
    BRA CODE_0483CA     ; $0483EA   |

CODE_0483EC:
    LDA #$0012          ; $0483EC   |
    STA $6F00,y         ; $0483EF   |
    LDA $7FEE           ; $0483F2   |
    BNE CODE_048400     ; $0483F5   |
    LDA $6FA2,y         ; $0483F7   |
    AND #$FFE0          ; $0483FA   |
    STA $6FA2,y         ; $0483FD   |

CODE_048400:
    LDA #$0000          ; $048400   |
    STA $7A96,y         ; $048403   |
    STA $7220,y         ; $048406   |
    STA $7540,y         ; $048409   |
    LDA #$FC00          ; $04840C   |
    STA $7222,y         ; $04840F   |

CODE_048412:
    RTL                 ; $048412   |

CODE_048413:
    LDY $7D36,x         ; $048413   |
    BPL CODE_048427     ; $048416   |
    LDA $61D6           ; $048418   |
    BNE CODE_048427     ; $04841B   |
    JSL $03A858         ; $04841D   |
    LDA #$0002          ; $048421   |
    STA $03BC           ; $048424   |

CODE_048427:
    RTL                 ; $048427   |

.init_chill
    RTL                 ; $048428   |

.main_chill
    JSL $03AF23         ; $048429   |
    LDA $7A96,x         ; $04842D   |
    BNE CODE_048441     ; $048430   |
    LDA #$0006          ; $048432   |
    STA $7A96,x         ; $048435   |
    DEC $7402,x         ; $048438   |
    BPL CODE_048441     ; $04843B   |
    JMP CODE_0403A3     ; $04843D   |

CODE_048441:
    TXA                 ; $048441   |
    STA $3002           ; $048442   |
    LDX #$09            ; $048445   |
    LDA #$9011          ; $048447   |
    JSL $7EDE44         ; $04844A   | GSU init

CODE_04844E:
    LDX $12             ; $04844E   |
    LDY $301C           ; $048450   |
    BMI CODE_0484BF     ; $048453   |
    LDA $6F00,y         ; $048455   |
    CMP #$0010          ; $048458   |
    BNE CODE_04846A     ; $04845B   |
    LDA $7D96,y         ; $04845D   |
    BNE CODE_04846A     ; $048460   |
    LDA $7040,y         ; $048462   |
    AND #$0040          ; $048465   |
    BNE CODE_048475     ; $048468   |

CODE_04846A:
    LDX #$09            ; $04846A   |
    LDA $301E           ; $04846C   |
    JSL $7EDE47         ; $04846F   | GSU init
    BRA CODE_04844E     ; $048473   |

CODE_048475:
    TYX                 ; $048475   |
    LDA #$00A0          ; $048476   |\ play sound #$00A0
    JSL $0085D2         ; $048479   |/
    LDA #$0200          ; $04847D   |
    STA $7D96,x         ; $048480   |
    STZ $7A98,x         ; $048483   |
    STZ $7220,x         ; $048486   |
    STZ $7540,x         ; $048489   |
    LDA #$FD00          ; $04848C   |
    STA $7222,x         ; $04848F   |
    LDA #$0040          ; $048492   |
    STA $7542,x         ; $048495   |
    LDA #$0400          ; $048498   |
    STA $75E2,x         ; $04849B   |
    LDA #$01CD          ; $04849E   |
    JSL $008B21         ; $0484A1   |
    LDA $70E2,x         ; $0484A5   |
    STA $70A2,y         ; $0484A8   |
    LDA $7182,x         ; $0484AB   |
    STA $7142,y         ; $0484AE   |
    LDA #$000B          ; $0484B1   |
    STA $7E4C,y         ; $0484B4   |
    LDA #$0004          ; $0484B7   |
    STA $7782,y         ; $0484BA   |
    LDX $12             ; $0484BD   |

CODE_0484BF:
    RTL                 ; $0484BF   |

.init_bubble
    RTL                 ; $0484C0   |

DATA_0484C1:         dw $0003
DATA_0484C3:         dw $0003
DATA_0484C5:         dw $0002
DATA_0484C7:         dw $0002
DATA_0484C9:         dw $0002
DATA_0484CB:         dw $0002
DATA_0484CD:         dw $0002
DATA_0484CF:         dw $0002
DATA_0484D1:         dw $0002
DATA_0484D3:         dw $0002
DATA_0484D5:         dw $0002
DATA_0484D7:         dw $0002
DATA_0484D9:         dw $0002
DATA_0484DB:         dw $0002
DATA_0484DD:         dw $0002
DATA_0484DF:         dw $0002
DATA_0484E1:         dw $0002
DATA_0484E3:         dw $0002
DATA_0484E5:         dw $0002
DATA_0484E7:         dw $0002
DATA_0484E9:         dw $0001
DATA_0484EB:         dw $0000

DATA_0484ED:         dw $FFF0, $0010
DATA_0484F1:         dw $FFE8, $0018
DATA_0484F5:         dw $FFE0, $0020
DATA_0484F9:         dw $FFD8, $0028

DATA_0484FD:         dw $0001
DATA_0484FF:         dw $0002
DATA_048501:         dw $0000
DATA_048503:         dw $0002

DATA_048505:         dw $FE00
DATA_048507:         dw $0200
DATA_048509:         dw $FE00
DATA_04850B:         dw $0200

.main_bubble
    JSL $03AF23         ; $04850D   |
    LDA $7A96,x         ; $048511   |
    BNE CODE_048579     ; $048514   |
    LDA $7A98,x         ; $048516   |
    BEQ CODE_048528     ; $048519   |
    LSR A               ; $04851B   |
    BEQ CODE_048524     ; $04851C   |
    JSL $0485E5         ; $04851E   |
    BRA CODE_04852C     ; $048522   |

CODE_048524:
    INC A               ; $048524   |
    STA $7402,x         ; $048525   |

CODE_048528:
    JSL $0485C9         ; $048528   |

CODE_04852C:
    LDA $7970           ; $04852C   |
    AND #$0003          ; $04852F   |
    ASL A               ; $048532   |
    LDY $7221,x         ; $048533   |
    BPL CODE_048539     ; $048536   |
    INC A               ; $048538   |

CODE_048539:
    ASL A               ; $048539   |
    TAY                 ; $04853A   |
    LDA $7220,x         ; $04853B   |
    CLC                 ; $04853E   |
    ADC $84ED,y         ; $04853F   | table
    STA $7220,x         ; $048542   |
    EOR $84ED,y         ; $048545   | table
    BMI CODE_04855D     ; $048548   |
    LDA $7970           ; $04854A   |
    AND #$0006          ; $04854D   |
    CLC                 ; $048550   |
    ADC #$0004          ; $048551   |
    STA $7976,x         ; $048554   |
    LDA #$0030          ; $048557   |
    STA $7A96,x         ; $04855A   |

CODE_04855D:
    LDA $7222,x         ; $04855D   |
    CMP #$FF80          ; $048560   |
    BPL CODE_048578     ; $048563   |
    LDA $7970           ; $048565   |
    AND #$0003          ; $048568   |
    ASL A               ; $04856B   |
    ASL A               ; $04856C   |
    TAY                 ; $04856D   |
    LDA $7222,x         ; $04856E   |
    CLC                 ; $048571   |
    ADC $84EF,y         ; $048572   | table
    STA $7222,x         ; $048575   |

CODE_048578:
    RTL                 ; $048578   |

CODE_048579:
    STZ $7220,x         ; $048579   |
    CMP #$0001          ; $04857C   |
    BNE CODE_048585     ; $04857F   |
    JMP CODE_0403A3     ; $048581   |

CODE_048585:
    BIT #$0003          ; $048585   |
    BNE CODE_0485C9     ; $048588   |
    LSR A               ; $04858A   |
    LSR A               ; $04858B   |
    ASL A               ; $04858C   |
    TAY                 ; $04858D   |
    LDA $84C1,y         ; $04858E   | table
    STA $7402,x         ; $048591   |
    DEC A               ; $048594   |
    BEQ CODE_0485B3     ; $048595   |
    DEC A               ; $048597   |
    BNE CODE_0485B9     ; $048598   |
    LDA $7976,x         ; $04859A   |
    BMI CODE_0485B9     ; $04859D   |
    DEC $7976,x         ; $04859F   |
    INC $18,x           ; $0485A2   |
    LDA $18,x           ; $0485A4   |
    AND #$0003          ; $0485A6   |
    ASL A               ; $0485A9   |
    TAY                 ; $0485AA   |
    LDA $84FD,y         ; $0485AB   | table
    STA $7402,x         ; $0485AE   |
    BRA CODE_0485B9     ; $0485B1   |

CODE_0485B3:
    DEC $7182,x         ; $0485B3   |
    DEC $7182,x         ; $0485B6   |

CODE_0485B9:
    LDA $7970           ; $0485B9   |
    AND #$0001          ; $0485BC   |
    BNE CODE_0485C2     ; $0485BF   |
    DEC A               ; $0485C1   |

CODE_0485C2:
    CLC                 ; $0485C2   |
    ADC $70E2,x         ; $0485C3   |
    STA $70E2,x         ; $0485C6   |

CODE_0485C9:
    LDY $7D36,x         ; $0485C9   | entry point
    BPL CODE_0485E5     ; $0485CC   |
    LDY $77C2,x         ; $0485CE   |
    LDA $8505,y         ; $0485D1   | table
    STA $60B4           ; $0485D4   |
    LDA #$FA00          ; $0485D7   |
    STA $60AA           ; $0485DA   |
    LDA #$0008          ; $0485DD   |
    STA $60C0           ; $0485E0   |
    BRA CODE_04862A     ; $0485E3   |

CODE_0485E5:
    TXA                 ; $0485E5   | entry point
    STA $3002           ; $0485E6   |
    LDX #$09            ; $0485E9   |
    LDA #$9011          ; $0485EB   |
    JSL $7EDE44         ; $0485EE   | GSU init
    LDX $12             ; $0485F2   |
    LDY $301C           ; $0485F4   |
    BMI CODE_048654     ; $0485F7   |
    LDA $6F00,y         ; $0485F9   |
    CMP #$0010          ; $0485FC   |
    BNE CODE_048654     ; $0485FF   |
    LDA $7040,y         ; $048601   |
    AND #$0020          ; $048604   |
    BEQ CODE_048654     ; $048607   |
    LDA $7C16,y         ; $048609   |
    ASL A               ; $04860C   |
    LDA #$FE00          ; $04860D   |
    BCS CODE_048615     ; $048610   |
    LDA #$0200          ; $048612   |

CODE_048615:
    STA $7220,y         ; $048615   |
    LDA #$FC00          ; $048618   |
    STA $7222,y         ; $04861B   |
    LDA #$0020          ; $04861E   |
    STA $7D38,y         ; $048621   |
    LDA #$0000          ; $048624   |
    STA $7978,y         ; $048627   |

CODE_04862A:
    LDA #$003B          ; $04862A   |\ play sound #$003B
    JSL $0085D2         ; $04862D   |/
    LDA #$01D0          ; $048631   |
    JSL $008B21         ; $048634   |
    LDA $70E2,x         ; $048638   |
    STA $70A2,y         ; $04863B   |
    LDA $7182,x         ; $04863E   |
    STA $7142,y         ; $048641   |
    LDA #$000A          ; $048644   |
    STA $7E4C,y         ; $048647   |
    LDA #$0002          ; $04864A   |
    STA $7782,y         ; $04864D   |
    JMP CODE_0403A3     ; $048650   |--

CODE_048654:
    RTL                 ; $048654   |

.init_freezegood_ski_lift
    LDA #$001C          ; $048655   |
    JSL $03A34C         ; $048658   |
    BCC CODE_04868A     ; $04865C   |
    INY                 ; $04865E   |
    TYA                 ; $04865F   |
    STA $7A38,x         ; $048660   |
    SEP #$20            ; $048663   |
    TXA                 ; $048665   |
    STA $79D6,y         ; $048666   |
    REP #$20            ; $048669   |
    LDA $703F,y         ; $04866B   |
    AND #$FFF3          ; $04866E   |
    STA $703F,y         ; $048671   |

CODE_048674:
    LDA $70E2,x         ; $048674   |
    STA $70E1,y         ; $048677   |
    LDA $7182,x         ; $04867A   |
    CLC                 ; $04867D   |
    ADC #$000D          ; $04867E   |
    STA $7181,y         ; $048681   |
    LDA $7220,x         ; $048684   |
    STA $721F,y         ; $048687   |
.init_ski_lift

CODE_04868A:
    RTL                 ; $04868A   |

DATA_04868B:         dw $0007
DATA_04868D:         dw $0005

DATA_04868F:         dw $0006
DATA_048691:         dw $0004

DATA_048693:         dw $0080
DATA_048695:         dw $FF80

DATA_048697:         dw $FFFC
DATA_048699:         dw $0004
DATA_04869B:         dw $FFF0
DATA_04869D:         dw $0000
DATA_04869F:         dw $000F
DATA_0486A1:         dw $FFFF
DATA_0486A3:         dw $FFF8
DATA_0486A5:         dw $0000
DATA_0486A7:         dw $0008
DATA_0486A9:         dw $000F
DATA_0486AB:         dw $0008
DATA_0486AD:         dw $FFFF
DATA_0486AF:         dw $001F
DATA_0486B1:         dw $FFFF
DATA_0486B3:         dw $000F
DATA_0486B5:         dw $FFF0

DATA_0486B7:         dw $FFE0
DATA_0486B9:         dw $0000
DATA_0486BB:         dw $0000
DATA_0486BD:         dw $0000
DATA_0486BF:         dw $0002
DATA_0486C1:         dw $0002
DATA_0486C3:         dw $FFFE
DATA_0486C5:         dw $FFFE
DATA_0486C7:         dw $0001
DATA_0486C9:         dw $0001
DATA_0486CB:         dw $0001
DATA_0486CD:         dw $FFFF
DATA_0486CF:         dw $FFFF
DATA_0486D1:         dw $FFFF
DATA_0486D3:         dw $FFFC
DATA_0486D5:         dw $FFFC
DATA_0486D7:         dw $FFFC
DATA_0486D9:         dw $0004

DATA_0486DB:         dw $0004
DATA_0486DD:         dw $0004
DATA_0486DF:         dw $0000
DATA_0486E1:         dw $0000
DATA_0486E3:         dw $00B5
DATA_0486E5:         dw $00B5
DATA_0486E7:         dw $00B5
DATA_0486E9:         dw $00B5
DATA_0486EB:         dw $00E4
DATA_0486ED:         dw $00E4
DATA_0486EF:         dw $00E4
DATA_0486F1:         dw $00E4
DATA_0486F3:         dw $00E4
DATA_0486F5:         dw $00E4
DATA_0486F7:         dw $0072
DATA_0486F9:         dw $0072
DATA_0486FB:         dw $0072
DATA_0486FD:         dw $0072
DATA_0486FF:         dw $0072
DATA_048701:         dw $0072
DATA_048703:         dw $0100
DATA_048705:         dw $0100

; also freezegood w/ ski lift
.main_ski_lift
    JSL $03A2DE         ; $048707   |
    BCC CODE_04871B     ; $04870B   |
    LDY $7A38,x         ; $04870D   |
    BEQ CODE_04871A     ; $048710   |
    DEY                 ; $048712   |
    TYX                 ; $048713   |
    JSL $03A31E         ; $048714   |
    LDX $12             ; $048718   |

CODE_04871A:
    RTL                 ; $04871A   |

CODE_04871B:
    JSL $03AF23         ; $04871B   |
    REP #$10            ; $04871F   |
    LDA $7902,x         ; $048721   |
    TAX                 ; $048724   |
    LDA $700006,x       ; $048725   |
    SEP #$10            ; $048729   |
    LDX $12             ; $04872B   |
    SEC                 ; $04872D   |
    SBC #$0092          ; $04872E   |
    CMP #$0002          ; $048731   |
    BCS CODE_04877B     ; $048734   |
    ASL A               ; $048736   |
    TAY                 ; $048737   |
    LDA $7220,x         ; $048738   |
    SEC                 ; $04873B   |
    SBC $8693,y         ; $04873C   | table
    EOR $8693,y         ; $04873F   | table
    BMI CODE_04874A     ; $048742   |
    LDA $8693,y         ; $048744   | table
    STA $7220,x         ; $048747   |

CODE_04874A:
    LDA $8697,y         ; $04874A   | table
    LDY #$00            ; $04874D   |
    CLC                 ; $04874F   |
    ADC $7220,x         ; $048750   |
    STA $7220,x         ; $048753   |
    BMI CODE_04875A     ; $048756   |
    LDY #$02            ; $048758   |

CODE_04875A:
    CLC                 ; $04875A   |
    ADC #$0010          ; $04875B   |
    CMP #$0020          ; $04875E   |
    STZ $7402,x         ; $048761   |
    BCS CODE_048769     ; $048764   |
    INC $7402,x         ; $048766   |

CODE_048769:
    TYA                 ; $048769   |
    STA $7400,x         ; $04876A   |
    LDA $7182,x         ; $04876D   |
    AND #$FFF0          ; $048770   |
    ORA #$0008          ; $048773   |
    STA $7182,x         ; $048776   |
    BRA CODE_0487E7     ; $048779   |

CODE_04877B:
    CMP #$0004          ; $04877B   |
    BCC CODE_0487E7     ; $04877E   |
    CMP #$0016          ; $048780   |
    BCS CODE_0487E7     ; $048783   |
    ASL A               ; $048785   |
    TAY                 ; $048786   |
    REP #$10            ; $048787   |
    LDA $7902,x         ; $048789   |
    TAX                 ; $04878C   |
    LDA $700000,x       ; $04878D   |
    AND #$000F          ; $048791   |
    STA $00             ; $048794   |
    SEP #$10            ; $048796   |
    LDX $86B7,y         ; $048798   | table
    STX $211B           ; $04879B   |
    LDX $86B8,y         ; $04879E   | table
    STX $211B           ; $0487A1   |
    TAX                 ; $0487A4   |
    STX $211C           ; $0487A5   |
    LDX $12             ; $0487A8   |
    LDA $7182,x         ; $0487AA   |
    CLC                 ; $0487AD   |
    ADC #$0008          ; $0487AE   |
    AND #$000F          ; $0487B1   |
    STA $02             ; $0487B4   |
    LDA $2134           ; $0487B6   |
    CMP #$8000          ; $0487B9   |
    ROR A               ; $0487BC   |
    CLC                 ; $0487BD   |
    ADC $8693,y         ; $0487BE   | table
    CLC                 ; $0487C1   |
    SBC $02             ; $0487C2   |
    BPL CODE_0487E7     ; $0487C4   |
    LSR $00             ; $0487C6   |
    LSR $00             ; $0487C8   |
    LSR $00             ; $0487CA   |
    ADC $7182,x         ; $0487CC   |
    STA $7182,x         ; $0487CF   |
    LDA #$0200          ; $0487D2   |
    STA $7222,x         ; $0487D5   |
    LDA $86DB,y         ; $0487D8   | table
    LDY $7400,x         ; $0487DB   |
    BNE CODE_0487E4     ; $0487DE   |
    EOR #$FFFF          ; $0487E0   |
    INC A               ; $0487E3   |

CODE_0487E4:
    STA $7220,x         ; $0487E4   |

CODE_0487E7:
    LDY $7400,x         ; $0487E7   |
    LDA $868B,y         ; $0487EA   | table
    STA $74A2,x         ; $0487ED   |
    LDA $7A38,x         ; $0487F0   |
    BEQ CODE_048815     ; $0487F3   |
    LDA $868F,y         ; $0487F5   | table
    LDY $7A38,x         ; $0487F8   |
    STA $74A1,y         ; $0487FB   |
    LDA $7400,x         ; $0487FE   |
    STA $73FF,y         ; $048801   |
    LDA $7222,x         ; $048804   |
    BEQ CODE_04880F     ; $048807   |
    ASL A               ; $048809   |
    ROL A               ; $04880A   |
    AND #$0001          ; $04880B   |
    INC A               ; $04880E   |

CODE_04880F:
    STA $79D7,y         ; $04880F   |
    JMP CODE_048674     ; $048812   |

CODE_048815:
    LDA $78,x           ; $048815   |
    BEQ CODE_048862     ; $048817   |
    LDA $60C0           ; $048819   |
    BEQ CODE_048844     ; $04881C   |
    LDA $60B4           ; $04881E   |
    BNE CODE_048836     ; $048821   |
    LDA $7220,x         ; $048823   |
    EOR $78,x           ; $048826   |
    BMI CODE_048836     ; $048828   |
    LDA $72C0,x         ; $04882A   |
    CLC                 ; $04882D   |
    ADC $608C           ; $04882E   |
    STA $608C           ; $048831   |
    BRA CODE_048867     ; $048834   |

CODE_048836:
    STZ $78,x           ; $048836   |
    LDA $60B4           ; $048838   |
    CLC                 ; $04883B   |
    ADC $7220,x         ; $04883C   |
    STA $60B4           ; $04883F   |
    BRA CODE_0488B3     ; $048842   |

CODE_048844:
    STZ $78,x           ; $048844   |
    LDA $868F,y         ; $048846   | table
    STA $611A           ; $048849   |
    LDA $7C16,x         ; $04884C   |
    SEC                 ; $04884F   |
    SBC $72C0,x         ; $048850   |
    STA $7C16,x         ; $048853   |
    LDA $72C0,x         ; $048856   |
    CLC                 ; $048859   |
    ADC $608C           ; $04885A   |
    STA $608C           ; $04885D   |
    BRA CODE_048867     ; $048860   |

CODE_048862:
    LDA $60C0           ; $048862   |
    BEQ CODE_0488B3     ; $048865   |

CODE_048867:
    LDA $60AA           ; $048867   |
    BMI CODE_0488B3     ; $04886A   |
    LDY $0D94           ; $04886C   |
    BNE CODE_0488B3     ; $04886F   |
    LDA $7C16,x         ; $048871   |
    CLC                 ; $048874   |
    ADC #$0014          ; $048875   |
    CMP #$0028          ; $048878   |
    BCS CODE_0488B3     ; $04887B   |
    LDA $7182,x         ; $04887D   |
    SEC                 ; $048880   |
    SBC $6090           ; $048881   |
    CMP #$FFF5          ; $048884   |
    BCC CODE_0488B3     ; $048887   |
    STA $00             ; $048889   |
    LDY $61B6           ; $04888B   |
    BEQ CODE_048895     ; $04888E   |
    CPX $61B6           ; $048890   |
    BNE CODE_0488B3     ; $048893   |

CODE_048895:
    STX $61B6           ; $048895   |
    LDA $00             ; $048898   |
    INC A               ; $04889A   |
    ADC $6090           ; $04889B   |
    STA $6090           ; $04889E   |
    LDA #$0400          ; $0488A1   |
    STA $60AA           ; $0488A4   |
    INC $61B4           ; $0488A7   |
    STZ $60FA           ; $0488AA   |
    LDA $7220,x         ; $0488AD   |
    STA $78,x           ; $0488B0   |
    RTL                 ; $0488B2   |

CODE_0488B3:
    CPX $61B6           ; $0488B3   |
    BNE CODE_0488BB     ; $0488B6   |
    STZ $61B6           ; $0488B8   |

CODE_0488BB:
    RTL                 ; $0488BB   |

.init_lava_log
    SEP #$20            ; $0488BC   |
    LDA #$FF            ; $0488BE   |
    STA $7863,x         ; $0488C0   |
    REP #$20            ; $0488C3   |
    LDA #$0008          ; $0488C5   |
    LDY $0136           ; $0488C8   |
    CPY #$03            ; $0488CB   |
    BEQ CODE_0488D3     ; $0488CD   |
    CPY #$0D            ; $0488CF   |
    BNE CODE_0488D6     ; $0488D1   |

CODE_0488D3:
    LDA #$FFF6          ; $0488D3   |

CODE_0488D6:
    STA $7720,x         ; $0488D6   |
    STA $16,x           ; $0488D9   |
    RTL                 ; $0488DB   |

.main_lava_log
    JSL $03AF23         ; $0488DC   |
    LDY $7862,x         ; $0488E0   |
    BEQ CODE_0488FA     ; $0488E3   |
    LDA $7222,x         ; $0488E5   |
    BPL CODE_04890F     ; $0488E8   |
    STZ $18,x           ; $0488EA   |
    SEC                 ; $0488EC   |
    SBC #$0008          ; $0488ED   |
    CMP #$FF80          ; $0488F0   |
    BCS CODE_048930     ; $0488F3   |
    LDA #$FF80          ; $0488F5   |
    BRA CODE_048930     ; $0488F8   |

CODE_0488FA:
    LDA $7222,x         ; $0488FA   |
    BMI CODE_04891C     ; $0488FD   |
    STZ $18,x           ; $0488FF   |
    CLC                 ; $048901   |
    ADC #$0008          ; $048902   |
    CMP #$0080          ; $048905   |
    BCC CODE_048930     ; $048908   |
    LDA #$0080          ; $04890A   |
    BRA CODE_048930     ; $04890D   |

CODE_04890F:
    LSR A               ; $04890F   |
    LSR A               ; $048910   |
    LSR A               ; $048911   |
    EOR #$FFFF          ; $048912   |
    INC A               ; $048915   |
    CLC                 ; $048916   |
    ADC #$FFFC          ; $048917   |
    BRA CODE_048927     ; $04891A   |

CODE_04891C:
    EOR #$FFFF          ; $04891C   |
    INC A               ; $04891F   |
    LSR A               ; $048920   |
    LSR A               ; $048921   |
    LSR A               ; $048922   |
    CLC                 ; $048923   |
    ADC #$0004          ; $048924   |

CODE_048927:
    CLC                 ; $048927   |
    ADC $18,x           ; $048928   |
    STA $18,x           ; $04892A   |
    CLC                 ; $04892C   |
    ADC $7222,x         ; $04892D   |

CODE_048930:
    STA $7222,x         ; $048930   |
    STZ $78,x           ; $048933   |
    LDA $60AA           ; $048935   |
    BMI CODE_04899B     ; $048938   |
    LDA $6120           ; $04893A   |
    CLC                 ; $04893D   |
    ADC #$0005          ; $04893E   |
    ASL A               ; $048941   |
    STA $00             ; $048942   |
    LSR A               ; $048944   |
    CLC                 ; $048945   |
    ADC $7C16,x         ; $048946   |
    CMP $00             ; $048949   |
    BCS CODE_04899B     ; $04894B   |
    LDA $7C18,x         ; $04894D   |
    SEC                 ; $048950   |
    SBC $6122           ; $048951   |
    SEC                 ; $048954   |
    SBC #$0010          ; $048955   |
    CMP #$FFF6          ; $048958   |
    BCC CODE_04899B     ; $04895B   |
    INC A               ; $04895D   |
    SEC                 ; $04895E   |
    ADC $6090           ; $04895F   |
    STA $6090           ; $048962   |
    LDA $7720,x         ; $048965   |
    SEC                 ; $048968   |
    SBC $16,x           ; $048969   |
    BNE CODE_048981     ; $04896B   |
    LDA #$FFF8          ; $04896D   |
    CLC                 ; $048970   |
    ADC $16,x           ; $048971   |
    STA $7720,x         ; $048973   |
    LDA $60AA           ; $048976   |
    LSR A               ; $048979   |
    CLC                 ; $04897A   |
    ADC $7222,x         ; $04897B   |
    STA $7222,x         ; $04897E   |

CODE_048981:
    LDA #$0100          ; $048981   |
    STA $60AA           ; $048984   |
    INC $61B4           ; $048987   |
    STZ $60FA           ; $04898A   |
    LDA $7C16,x         ; $04898D   |
    BNE CODE_048993     ; $048990   |
    INC A               ; $048992   |

CODE_048993:
    ASL A               ; $048993   |
    AND #$01FE          ; $048994   |
    STA $78,x           ; $048997   |
    BRA CODE_0489B2     ; $048999   |

CODE_04899B:
    LDA $7720,x         ; $04899B   |
    SEC                 ; $04899E   |
    SBC $16,x           ; $04899F   |
    BEQ CODE_0489B2     ; $0489A1   |
    LDA $16,x           ; $0489A3   |
    STA $7720,x         ; $0489A5   |
    LDA $7222,x         ; $0489A8   |
    SEC                 ; $0489AB   |
    SBC #$0100          ; $0489AC   |
    STA $7222,x         ; $0489AF   |

CODE_0489B2:
    RTL                 ; $0489B2   |

.main_shy_guy_bandit
    LDY #$05            ; $0489B3   |
    STY $76,x           ; $0489B5   |
    RTL                 ; $0489B7   |

; Shy Guy colors
DATA_0489B8:         dw $0001				 ; Green
DATA_0489BA:         dw $0003				 ; Red
DATA_0489BC:         dw $0005				 ; Yellow
DATA_0489BE:         dw $0009				 ; Pink

.init_shy_guy
    STZ $7900,x         ; $0489C0   |
    LDA $7902,x         ; $0489C3   |
    BNE CODE_0489F8     ; $0489C6   |
    JSL $0EB8AE         ; $0489C8   |
    BNE CODE_0489F8     ; $0489CC   |
    LDA #$0060          ; $0489CE   |
    STA $6FA0,x         ; $0489D1   |
    LDA #$4000          ; $0489D4   |
    STA $6FA2,x         ; $0489D7   |
    LDA #$0005          ; $0489DA   |
    STA $7040,x         ; $0489DD   |
    LDA #$00FF          ; $0489E0   |
    STA $74A2,x         ; $0489E3   |
    STZ $7542,x         ; $0489E6   |
    LDA $70E2,x         ; $0489E9   |
    CLC                 ; $0489EC   |
    ADC #$0008          ; $0489ED   |
    STA $70E2,x         ; $0489F0   |
    LDY #$08            ; $0489F3   |
    STY $76,x           ; $0489F5   |
    RTL                 ; $0489F7   |

CODE_0489F8:
    JSL $048A18         ; $0489F8   |
    JSL $02A007         ; $0489FC   |
    LDA #$0018          ; $048A00   | entry
    STA $7A96,x         ; $048A03   |
    LDA #$0004          ; $048A06   |
    STA $16,x           ; $048A09   |
    LDA $7360,x         ; $048A0B   |
    CMP #$001E          ; $048A0E   |
    BEQ CODE_048A17     ; $048A11   |
    LDY #$02            ; $048A13   |
    STY $78,x           ; $048A15   |

CODE_048A17:
    RTL                 ; $048A17   |

; shy guy sub
    LDA $7902,x         ; $048A18   |
    BIT #$0001          ; $048A1B   |
    BNE CODE_048A3C     ; $048A1E   |
    LDA $70E2,x         ; $048A20   |
    AND #$0010          ; $048A23   |
    LSR A               ; $048A26   |
    LSR A               ; $048A27   |
    LSR A               ; $048A28   |
    STA $00             ; $048A29   |
    LDA $7182,x         ; $048A2B   |
    AND #$0010          ; $048A2E   |
    LSR A               ; $048A31   |
    LSR A               ; $048A32   |
    ORA $00             ; $048A33   |
    TAY                 ; $048A35   |
    LDA $89B8,y         ; $048A36   | table
    STA $7902,x         ; $048A39   |

CODE_048A3C:
    AND #$00FE          ; $048A3C   |
    ORA #$0020          ; $048A3F   |
    STA $7042,x         ; $048A42   |
    RTL                 ; $048A45   |

shy_guy_state_ptr:
DATA_048A46:         dw $8DA0
DATA_048A48:         dw $8E14
DATA_048A4A:         dw $8EB5
DATA_048A4C:         dw $8F0F
DATA_048A4E:         dw $8F22
DATA_048A50:         dw $8000
DATA_048A52:         dw $8F57
DATA_048A54:         dw $8F90
DATA_048A56:         dw $8FD0

.main_shy_guy
    LDY $76,x           ; $048A58   |
    CPY #$08            ; $048A5A   |
    BEQ CODE_048A8A     ; $048A5C   |
    JSR CODE_048ACB     ; $048A5E   |
    LDY $76,x           ; $048A61   |
    CPY #$02            ; $048A63   |
    BNE CODE_048A8A     ; $048A65   |
    LDA $6F00,x         ; $048A67   |
    SEC                 ; $048A6A   |
    SBC #$0010          ; $048A6B   |
    ORA $7D96,x         ; $048A6E   |
    BNE CODE_048A8A     ; $048A71   |
    LDA $61B0           ; $048A73   |
    ORA $0B55           ; $048A76   |
    ORA $0398           ; $048A79   |
    BNE CODE_048AAB     ; $048A7C   |
    LDA $7860,x         ; $048A7E   |
    AND #$000C          ; $048A81   |
    BEQ CODE_048A8E     ; $048A84   |
    JMP CODE_0403B2     ; $048A86   |

CODE_048A8A:
    JSL $03AF23         ; $048A8A   |

CODE_048A8E:
    LDY $76,x           ; $048A8E   |
    TYA                 ; $048A90   |
    ASL A               ; $048A91   |
    TXY                 ; $048A92   |
    TAX                 ; $048A93   |
    JSR ($8A46,x)       ; $048A94   | state table
    LDY $76,x           ; $048A97   |
    CPY #$08            ; $048A99   |
    BEQ CODE_048AAB     ; $048A9B   |
    LDA $7AF6,x         ; $048A9D   |
    BNE CODE_048AA8     ; $048AA0   |
    JSR CODE_048B8D     ; $048AA2   |
    JSR CODE_048BDF     ; $048AA5   |

CODE_048AA8:
    JSR CODE_048AAC     ; $048AA8   |

CODE_048AAB:
    RTL                 ; $048AAB   |

; shy guy sub

CODE_048AAC:
    LDA $6FA0,x         ; $048AAC   |
    AND #$FFBF          ; $048AAF   |
    LDY $76,x           ; $048AB2   |
    CPY #$04            ; $048AB4   |
    BEQ CODE_048AC3     ; $048AB6   |
    LDY $7A36,x         ; $048AB8   |
    BEQ CODE_048AC3     ; $048ABB   |
    DEC $7A36,x         ; $048ABD   |
    ORA #$0040          ; $048AC0   |

CODE_048AC3:
    STA $6FA0,x         ; $048AC3   |
    RTS                 ; $048AC6   |

DATA_048AC7:         dw $001B
DATA_048AC9:         dw $001C

; shy guy sub

CODE_048ACB:
    LDA $7722,x         ; $048ACB   |
    BMI CODE_048B0D     ; $048ACE   |
    LDA $6F00,x         ; $048AD0   |
    CMP #$0008          ; $048AD3   |
    BNE CODE_048ADD     ; $048AD6   |
    LDY $74A2,x         ; $048AD8   |
    BMI CODE_048B0A     ; $048ADB   |

CODE_048ADD:
    LDY $7403,x         ; $048ADD   |
    BNE CODE_048B0A     ; $048AE0   |
    LDA $7362,x         ; $048AE2   |
    BMI CODE_048B0A     ; $048AE5   |
    JSL $03AA2E         ; $048AE7   |
    REP #$10            ; $048AEB   |
    LDY $7362,x         ; $048AED   |
    LDA #$8000          ; $048AF0   |
    STA $6008,y         ; $048AF3   |
    STA $6010,y         ; $048AF6   |
    LDA $7040,x         ; $048AF9   |
    AND #$2000          ; $048AFC   |
    BEQ CODE_048B0A     ; $048AFF   |
    LDA #$8000          ; $048B01   |
    STA $6018,y         ; $048B04   |
    STA $6020,y         ; $048B07   |

CODE_048B0A:
    SEP #$10            ; $048B0A   |
    RTS                 ; $048B0C   |

CODE_048B0D:
    LDA $6F00,x         ; $048B0D   |
    CMP #$0010          ; $048B10   |
    BNE CODE_048B72     ; $048B13   |
    LDA $7D96,x         ; $048B15   |
    BNE CODE_048B0A     ; $048B18   |
    LDY $76,x           ; $048B1A   |
    CPY #$04            ; $048B1C   |
    BEQ CODE_048B24     ; $048B1E   |

CODE_048B20:
    LDY $78,x           ; $048B20   |
    BNE CODE_048B3E     ; $048B22   |

CODE_048B24:
    REP #$10            ; $048B24   |
    LDY $7362,x         ; $048B26   |
    LDA $6004,y         ; $048B29   |
    AND #$F1FF          ; $048B2C   |
    STA $6004,y         ; $048B2F   |
    LDA $600C,y         ; $048B32   |
    AND #$F1FF          ; $048B35   |
    STA $600C,y         ; $048B38   |
    SEP #$10            ; $048B3B   |
    RTS                 ; $048B3D   |

CODE_048B3E:
    LDY $79,x           ; $048B3E   |
    LDA $7AF8,x         ; $048B40   |
    BNE CODE_048B58     ; $048B43   |
    LDA $10             ; $048B45   |
    AND #$0003          ; $048B47   |
    INC A               ; $048B4A   |
    INC A               ; $048B4B   |
    STA $7AF8,x         ; $048B4C   |
    INY                 ; $048B4F   |
    INY                 ; $048B50   |
    TYA                 ; $048B51   |
    AND #$0002          ; $048B52   |
    TAY                 ; $048B55   |
    STY $79,x           ; $048B56   |

CODE_048B58:
    LDA $8AC7,y         ; $048B58   |
    STA $02             ; $048B5B   |
    REP #$10            ; $048B5D   |
    LDY $7362,x         ; $048B5F   |
    LDA $6004,y         ; $048B62   |
    ORA $02             ; $048B65   |
    AND #$F1FF          ; $048B67   |
    ORA #$0200          ; $048B6A   |
    STA $6004,y         ; $048B6D   |
    SEP #$10            ; $048B70   |

CODE_048B72:
    RTS                 ; $048B72   |

; l sub
    LDA #$0020          ; $048B73   |
    STA $7A36,x         ; $048B76   |
    LDA $7722,x         ; $048B79   |
    BMI CODE_048B82     ; $048B7C   |
    JSL $03AEFD         ; $048B7E   |

CODE_048B82:
    JSR CODE_048C80     ; $048B82   |
    PHB                 ; $048B85   |
    PHK                 ; $048B86   |
    PLB                 ; $048B87   |
    JSR CODE_048EBB     ; $048B88   |
    PLB                 ; $048B8B   |
    RTL                 ; $048B8C   |

; shy guy sub

CODE_048B8D:
    LDY $7D36,x         ; $048B8D   |
    BMI CODE_048B9B     ; $048B90   |
    CPX $61B6           ; $048B92   |
    BNE CODE_048B9A     ; $048B95   |
    STZ $61B6           ; $048B97   |

CODE_048B9A:
    RTS                 ; $048B9A   |

CODE_048B9B:
    LDY $76,x           ; $048B9B   |
    LDA $7360,x         ; $048B9D   |
    CMP #$0074          ; $048BA0   |
    BNE CODE_048BAB     ; $048BA3   |
    CPY #$03            ; $048BA5   |
    BNE CODE_048BBB     ; $048BA7   |
    BRA CODE_048BAF     ; $048BA9   |

CODE_048BAB:
    CPY #$02            ; $048BAB   |
    BNE CODE_048BB4     ; $048BAD   |

CODE_048BAF:
    PLA                 ; $048BAF   |
    JMP CODE_0403B2     ; $048BB0   |

CODE_048BB4:
    CPY #$05            ; $048BB4   |
    BNE CODE_048BBB     ; $048BB6   |
    JSR CODE_048D13     ; $048BB8   |

CODE_048BBB:
    LDA $7C18,x         ; $048BBB   |
    SEC                 ; $048BBE   |
    SBC $6122           ; $048BBF   |
    SEC                 ; $048BC2   |
    SBC $7BB8,x         ; $048BC3   |
    CMP #$FFF8          ; $048BC6   |
    BCS CODE_048BD0     ; $048BC9   |
    PLA                 ; $048BCB   |
    JSL $03A813         ; $048BCC   |

CODE_048BD0:
    PLA                 ; $048BD0   |
    STA $00             ; $048BD1   |
    JSL $03A5B7         ; $048BD3   |
    LDA $00             ; $048BD7   |
    PHA                 ; $048BD9   |
    RTS                 ; $048BDA   |

; long version of sub below
    JSR CODE_048BDF     ; $048BDB   |
    RTL                 ; $048BDE   |

; shy guy sub

CODE_048BDF:
    TXA                 ; $048BDF   |
    STA $3002           ; $048BE0   |
    LDX #$09            ; $048BE3   |
    LDA #$9011          ; $048BE5   |
    JSL $7EDE44         ; $048BE8   | GSU init

CODE_048BEC:
    LDX $12             ; $048BEC   |
    LDY $301C           ; $048BEE   |
    BMI CODE_048BF5     ; $048BF1   |
    BNE CODE_048C01     ; $048BF3   |

CODE_048BF5:
    RTS                 ; $048BF5   |

; branched to from below

CODE_048BF6:
    LDX #$09            ; $048BF6   |
    LDA $301E           ; $048BF8   |
    JSL $7EDE44         ; $048BFB   | GSU init
    BRA CODE_048BEC     ; $048BFF   |

; branched to from above

CODE_048C01:
    LDA $7360,x         ; $048C01   |
    CMP #$0074          ; $048C04   |
    BNE CODE_048C16     ; $048C07   |
    LDA $76,x           ; $048C09   |
    AND #$00FF          ; $048C0B   |
    CMP #$0003          ; $048C0E   |
    BNE CODE_048C23     ; $048C11   |
    JMP CODE_048CED     ; $048C13   |

CODE_048C16:
    LDA $76,x           ; $048C16   |
    AND #$00FF          ; $048C18   |
    CMP #$0002          ; $048C1B   |
    BNE CODE_048C23     ; $048C1E   |
    JMP CODE_048CED     ; $048C20   |

CODE_048C23:
    LDA $6FA0,y         ; $048C23   |
    AND #$0200          ; $048C26   |
    BEQ CODE_048BF6     ; $048C29   |
    LDA $6F00,y         ; $048C2B   |
    CMP #$0010          ; $048C2E   |
    BNE CODE_048BF6     ; $048C31   |
    LDA $7D38,y         ; $048C33   |
    BEQ CODE_048BF6     ; $048C36   |
    LDA $7360,y         ; $048C38   |
    CMP #$0156          ; $048C3B   |
    BEQ CODE_048BF6     ; $048C3E   |
    CMP #$001E          ; $048C40   |
    BEQ CODE_048C54     ; $048C43   |
    CMP #$012A          ; $048C45   |
    BEQ CODE_048C54     ; $048C48   |
    CMP #$0133          ; $048C4A   |
    BEQ CODE_048C54     ; $048C4D   |
    CMP #$0074          ; $048C4F   |
    BNE CODE_048C5E     ; $048C52   |

CODE_048C54:
    TYX                 ; $048C54   |
    JSL $03B273         ; $048C55   |
    PLA                 ; $048C59   |
    JMP CODE_0403B2     ; $048C5A   |

CODE_048C5E:
    LDA $7220,y         ; $048C5E   |
    PHP                 ; $048C61   |
    LDA #$0200          ; $048C62   |
    PLP                 ; $048C65   |
    BPL CODE_048C6B     ; $048C66   |
    LDA #$FE00          ; $048C68   |

CODE_048C6B:
    STA $7220,x         ; $048C6B   |
    TYX                 ; $048C6E   |
    JSL $03B24B         ; $048C6F   |
    LDA #$FF00          ; $048C73   |
    STA $7222,x         ; $048C76   |
    LDA #$0067          ; $048C79   |\ play sound #$0067
    JSL $0085D2         ; $048C7C   |/

CODE_048C80:
    LDA #$0001          ; $048C80   |
    STA $7D38,x         ; $048C83   |
    LDA #$FFF0          ; $048C86   |
    STA $7900,x         ; $048C89   |
    LDA $7220,x         ; $048C8C   |
    BEQ CODE_048CA0     ; $048C8F   |
    LDA $7400,x         ; $048C91   |
    DEC A               ; $048C94   |
    EOR $7220,x         ; $048C95   |
    BPL CODE_048CA0     ; $048C98   |
    LDA #$0010          ; $048C9A   |
    STA $7900,x         ; $048C9D   |

CODE_048CA0:
    STZ $75E0,x         ; $048CA0   |
    STZ $7540,x         ; $048CA3   |
    LDY #$02            ; $048CA6   |
    LDA $7360,x         ; $048CA8   |
    CMP #$0074          ; $048CAB   |
    BNE CODE_048CB2     ; $048CAE   |
    LDY #$03            ; $048CB0   |

CODE_048CB2:
    STY $76,x           ; $048CB2   |
    LDA #$0040          ; $048CB4   |
    STA $7542,x         ; $048CB7   |
    LSR A               ; $048CBA   |
    ORA $7042,x         ; $048CBB   |
    STA $7042,x         ; $048CBE   |
    LDA #$0005          ; $048CC1   |
    STA $7402,x         ; $048CC4   |
    LDA $7360,x         ; $048CC7   |
    CMP #$001E          ; $048CCA   |
    BNE CODE_048CD1     ; $048CCD   |
    STZ $78,x           ; $048CCF   |

CODE_048CD1:
    LDA #$0841          ; $048CD1   |
    STA $6FA2,x         ; $048CD4   |
    STZ $7A38,x         ; $048CD7   |
    JSL $03AD24         ; $048CDA   |
    BCS CODE_048CEC     ; $048CDE   |
    LDA $7042,x         ; $048CE0   |
    ORA #$0080          ; $048CE3   |
    STA $7042,x         ; $048CE6   |
    STZ $7402,x         ; $048CE9   |

CODE_048CEC:
    RTS                 ; $048CEC   |

CODE_048CED:
    LDA $6F00,y         ; $048CED   |
    CMP #$0010          ; $048CF0   |
    BNE CODE_048CFD     ; $048CF3   |
    LDA $6FA2,y         ; $048CF5   |
    AND #$6000          ; $048CF8   |
    BEQ CODE_048D00     ; $048CFB   |

CODE_048CFD:
    JMP CODE_048BF6     ; $048CFD   |--

CODE_048D00:
    LDA $6FA0,y         ; $048D00   |
    AND #$0020          ; $048D03   |
    BNE CODE_048CFD     ; $048D06   |
    LDA $7360,y         ; $048D08   |
    CMP #$0156          ; $048D0B   |
    BEQ CODE_048CFD     ; $048D0E   |
    JMP CODE_048C54     ; $048D10   |

; shy guy sub

CODE_048D13:
    LDA $61B2           ; $048D13   |
    BPL CODE_048D5C     ; $048D16   |
    LDA $7E48           ; $048D18   |
    BEQ CODE_048D1F     ; $048D1B   |
    BPL CODE_048D5C     ; $048D1D   |

CODE_048D1F:
    JSL $06BEBA         ; $048D1F   |
    LDA #$0020          ; $048D23   |
    JSL $03A364         ; $048D26   |
    BCC CODE_048D40     ; $048D2A   |
    LDA $70E2,x         ; $048D2C   |
    STA $70E2,y         ; $048D2F   |
    STA $04             ; $048D32   |
    LDA $7182,x         ; $048D34   |
    STA $7182,y         ; $048D37   |
    STA $06             ; $048D3A   |
    JSL $048D5F         ; $048D3C   |

CODE_048D40:
    LDA #$000A          ; $048D40   |
    STA $6F00,x         ; $048D43   |
    TXA                 ; $048D46   |
    STA $7E48           ; $048D47   |
    LDA #$8000          ; $048D4A   |
    STA $0390           ; $048D4D   |
    LDA #$FFFF          ; $048D50   |
    STA $0CD0           ; $048D53   |
    LDA #$0020          ; $048D56   |
    STA $0CC8           ; $048D59   |

CODE_048D5C:
    PLA                 ; $048D5C   | \
    PLA                 ; $048D5D   |  | back all the way out of shyguy
    RTL                 ; $048D5E   | /

; shy guy sub
    LDA $77C2,x         ; $048D5F   |
    AND #$00FF          ; $048D62   |
    STA $7400           ; $048D65   |
    EOR #$0002          ; $048D68   |
    STA $7400,y         ; $048D6B   |
    LDA #$0000          ; $048D6E   |
    STA $7402,y         ; $048D71   |
    STA $7978,y         ; $048D74   |
    SEP #$20            ; $048D77   |
    LDA #$0E            ; $048D79   |
    STA $79D6,y         ; $048D7B   |
    REP #$20            ; $048D7E   |
    STY $18             ; $048D80   |
    LDA $04             ; $048D82   |
    STA $70E2           ; $048D84   |
    LDA $06             ; $048D87   |
    SEC                 ; $048D89   |
    SBC #$000E          ; $048D8A   |
    STA $7182           ; $048D8D   |
    TYX                 ; $048D90   |
    JSL $06BE72         ; $048D91   |
    LDX $12             ; $048D95   |
    RTL                 ; $048D97   |

DATA_048D98:         dw $FEF4, $010C

DATA_048D9C:         dw $FFA7, $0059

; shy guy state 00
    TYX                 ; $048DA0   |
    LDA $7860,x         ; $048DA1   |
    LSR A               ; $048DA4   |
    BCC CODE_048DAA     ; $048DA5   |
    STZ $7220,x         ; $048DA7   |

CODE_048DAA:
    LDA $7A96,x         ; $048DAA   |
    BNE CODE_048DC2     ; $048DAD   |
    DEC $16,x           ; $048DAF   |
    BEQ CODE_048DC3     ; $048DB1   |
    LDA #$0018          ; $048DB3   |
    STA $7A96,x         ; $048DB6   |
    LDA $7400,x         ; $048DB9   |
    EOR #$0002          ; $048DBC   |
    STA $7400,x         ; $048DBF   |

CODE_048DC2:
    RTS                 ; $048DC2   |

CODE_048DC3:
    LDA $10             ; $048DC3   |
    AND #$0003          ; $048DC5   |
    BNE CODE_048DD1     ; $048DC8   |
    LDY $77C2,x         ; $048DCA   |
    TYA                 ; $048DCD   |
    STA $7400,x         ; $048DCE   |

CODE_048DD1:
    LDY $7400,x         ; $048DD1   |
    LDA $8D9C,y         ; $048DD4   |
    STA $75E0,x         ; $048DD7   |
    LDA $10             ; $048DDA   |
    AND #$001F          ; $048DDC   |
    CLC                 ; $048DDF   |
    ADC #$0020          ; $048DE0   |
    CPY #$00            ; $048DE3   |
    BNE CODE_048DEB     ; $048DE5   |
    EOR #$FFFF          ; $048DE7   |
    INC A               ; $048DEA   |

CODE_048DEB:
    CLC                 ; $048DEB   |
    ADC $70E2,x         ; $048DEC   |
    STA $7A38,x         ; $048DEF   |
    LDA #$0005          ; $048DF2   |
    STA $7540,x         ; $048DF5   |
    INC $76,x           ; $048DF8   |
    RTS                 ; $048DFA   |

DATA_048DFB:         dw $0004
DATA_048DFD:         dw $0008

DATA_048DFF:         db $02, $02, $03, $03
DATA_048E03:         db $03, $03, $02, $01
DATA_048E07:         db $01, $02, $02, $02
DATA_048E0B:         db $02, $01

DATA_048E0D:         db $00, $03, $00, $02
DATA_048E11:         db $04, $01, $02

; shy guy state 01
    TYX                 ; $048E14   |
    LDA $7860,x         ; $048E15   |
    BIT #$000C          ; $048E18   |
    BNE CODE_048E90     ; $048E1B   |
    AND #$0001          ; $048E1D   |
    STA $00             ; $048E20   |
    LDY $6F02,x         ; $048E22   |
    TYA                 ; $048E25   |
    ORA $00             ; $048E26   |
    BEQ CODE_048E90     ; $048E28   |
    LDA $70E2,x         ; $048E2A   |
    SEC                 ; $048E2D   |
    SBC $7A38,x         ; $048E2E   |
    CLC                 ; $048E31   |
    ADC #$0008          ; $048E32   |
    CMP #$0010          ; $048E35   |
    BCC CODE_048E90     ; $048E38   |
    LDA $7A98,x         ; $048E3A   |
    BNE CODE_048E8F     ; $048E3D   |
    LDA $7360,x         ; $048E3F   | \
    CMP #$0124          ; $048E42   |  | if not stretch guy
    BNE CODE_048E63     ; $048E45   | /
    LDY #$00            ; $048E47   |
    LDA $7540,x         ; $048E49   |
    CMP #$0005          ; $048E4C   |
    BNE CODE_048E53     ; $048E4F   |
    INY                 ; $048E51   |
    INY                 ; $048E52   |

CODE_048E53:
    LDA $8DFB,y         ; $048E53   | table
    STA $7A98,x         ; $048E56   |
    LDA $7402,x         ; $048E59   |
    EOR #$0001          ; $048E5C   |
    STA $7402,x         ; $048E5F   |
    RTS                 ; $048E62   |

CODE_048E63:
    INC $77,x           ; $048E63   |
    LDY $77,x           ; $048E65   |
    CPY #$07            ; $048E67   |
    BMI CODE_048E6F     ; $048E69   |
    LDY #$00            ; $048E6B   |
    STY $77,x           ; $048E6D   |

CODE_048E6F:
    LDA $8E0D,y         ; $048E6F   |
    AND #$00FF          ; $048E72   |
    STA $7402,x         ; $048E75   |
    LDA $7540,x         ; $048E78   |
    CMP #$0005          ; $048E7B   |
    BEQ CODE_048E86     ; $048E7E   |
    TYA                 ; $048E80   |
    CLC                 ; $048E81   |
    ADC #$0007          ; $048E82   |
    TAY                 ; $048E85   |

CODE_048E86:
    LDA $8DFF,y         ; $048E86   |
    AND #$00FF          ; $048E89   |
    STA $7A98,x         ; $048E8C   |

CODE_048E8F:
    RTS                 ; $048E8F   |

CODE_048E90:
    LDA #$0018          ; $048E90   |
    STA $7A96,x         ; $048E93   |
    LDA $10             ; $048E96   |
    AND #$0001          ; $048E98   |
    CLC                 ; $048E9B   |
    ADC #$0003          ; $048E9C   |
    STA $16,x           ; $048E9F   |
    LDY #$00            ; $048EA1   |
    STY $77,x           ; $048EA3   |
    STZ $7402,x         ; $048EA5   |
    STZ $7220,x         ; $048EA8   |
    STZ $7540,x         ; $048EAB   |
    STZ $76,x           ; $048EAE   |
    RTS                 ; $048EB0   |

DATA_048EB1:         dw $6020, $2040

; shy guy state 02
    TYX                 ; $048EB5   |
    LDA $7722,x         ; $048EB6   |
    BMI CODE_048F0E     ; $048EB9   |

CODE_048EBB:
    LDA $7A38,x         ; $048EBB   |
    SEC                 ; $048EBE   |
    SBC $7900,x         ; $048EBF   |
    AND #$00FF          ; $048EC2   |
    STA $7A38,x         ; $048EC5   |
    STA $300A           ; $048EC8   |
    LDA $7360,x         ; $048ECB   |
    CMP #$0074          ; $048ECE   |
    BNE CODE_048EDA     ; $048ED1   |
    LDA #$20B0          ; $048ED3   |
    LDY #$54            ; $048ED6   |
    BRA CODE_048EE1     ; $048ED8   |

CODE_048EDA:
    LDY $78,x           ; $048EDA   |
    LDA $8EB1,y         ; $048EDC   |
    LDY #$54            ; $048EDF   |

CODE_048EE1:
    STA $3018           ; $048EE1   |
    TYA                 ; $048EE4   |
    STA $301A           ; $048EE5   |
    LDA #$0100          ; $048EE8   |
    STA $300C           ; $048EEB   |
    LDY $7722,x         ; $048EEE   |
    TYX                 ; $048EF1   |
    LDA $03A9CE,x       ; $048EF2   |
    STA $3006           ; $048EF6   |
    LDA $03A9EE,x       ; $048EF9   |
    STA $3004           ; $048EFD   |
    LDX #$08            ; $048F00   |
    LDA #$867E          ; $048F02   |
    JSL $7EDE44         ; $048F05   | GSU init
    LDX $12             ; $048F09   |
    INC $0CF9           ; $048F0B   |

CODE_048F0E:
    RTS                 ; $048F0E   |

; shy guy state 03
    TYX                 ; $048F0F   |
    LDA $7860,x         ; $048F10   |
    AND #$001F          ; $048F13   |
    BEQ CODE_048F21     ; $048F16   |
    LDA #$0040          ; $048F18   |
    STA $7542,x         ; $048F1B   |
    JSR CODE_048E90     ; $048F1E   |

CODE_048F21:
    RTS                 ; $048F21   |

; shy guy state 04
    TYX                 ; $048F22   |
    PLA                 ; $048F23   |
    STA $00             ; $048F24   |
    JSL $04C833         ; $048F26   |
    LDA $00             ; $048F2A   |
    PHA                 ; $048F2C   |
    LDA $7A96,x         ; $048F2D   |
    ORA $7542,x         ; $048F30   |
    BNE CODE_048F56     ; $048F33   |
    LDY $16,x           ; $048F35   |
    BNE CODE_048F48     ; $048F37   |
    LDA $10             ; $048F39   |
    AND #$0018          ; $048F3B   |
    CLC                 ; $048F3E   |
    ADC #$0020          ; $048F3F   |
    STA $7A96,x         ; $048F42   |
    INC $16,x           ; $048F45   |
    RTS                 ; $048F47   |

CODE_048F48:
    LDA #$FE00          ; $048F48   |
    STA $7222,x         ; $048F4B   |
    LDA #$0040          ; $048F4E   |
    STA $7542,x         ; $048F51   |
    STZ $16,x           ; $048F54   |

CODE_048F56:
    RTS                 ; $048F56   |

; shy guy state 06
    TYX                 ; $048F57   |
    LDA $7A98,x         ; $048F58   |
    BNE CODE_048F8B     ; $048F5B   |
    LDA $7222,x         ; $048F5D   |
    BEQ CODE_048F76     ; $048F60   |
    LDA $18,x           ; $048F62   |
    CMP $7182,x         ; $048F64   |
    BMI CODE_048F8B     ; $048F67   |
    STA $7182,x         ; $048F69   |
    STZ $7222,x         ; $048F6C   |
    LDA #$0020          ; $048F6F   |
    STA $7A98,x         ; $048F72   |
    RTS                 ; $048F75   |

CODE_048F76:
    LDA #$FC00          ; $048F76   |
    STA $7222,x         ; $048F79   |
    LDA #$0040          ; $048F7C   |
    STA $7542,x         ; $048F7F   |
    LDA #$0077          ; $048F82   |\ play sound #$0077
    JSL $0085D2         ; $048F85   |/
    INC $76,x           ; $048F89   |

CODE_048F8B:
    RTS                 ; $048F8B   |

DATA_048F8C:         dw $FF00
DATA_048F8E:         dw $0100

; shy guy state 07
    TYX                 ; $048F90   |
    LDY $7223,x         ; $048F91   |
    BMI CODE_048FA2     ; $048F94   |
    LDA $7860,x         ; $048F96   |
    LSR A               ; $048F99   |
    BCC CODE_048FCF     ; $048F9A   |
    STZ $7220,x         ; $048F9C   |
    STZ $76,x           ; $048F9F   |
    RTS                 ; $048FA1   |

CODE_048FA2:
    LDA $7220,x         ; $048FA2   |
    BNE CODE_048FCF     ; $048FA5   |
    LDA $70E2,x         ; $048FA7   |
    CLC                 ; $048FAA   |
    ADC #$0008          ; $048FAB   |
    STA $3010           ; $048FAE   |
    LDA $7182,x         ; $048FB1   |
    CLC                 ; $048FB4   |
    ADC #$000F          ; $048FB5   |
    JSL $0EB8B7         ; $048FB8   |
    BEQ CODE_048FCF     ; $048FBC   |
    STZ $18,x           ; $048FBE   |
    LDA #$0E81          ; $048FC0   |
    STA $6FA2,x         ; $048FC3   |
    LDY $7400,x         ; $048FC6   |
    LDA $8F8C,y         ; $048FC9   | table
    STA $7220,x         ; $048FCC   |

CODE_048FCF:
    RTS                 ; $048FCF   |

; shy guy state 08
    TYX                 ; $048FD0   |
    LDA $7A96,x         ; $048FD1   |
    ORA $61AE           ; $048FD4   |
    ORA $60AC           ; $048FD7   |
    BNE CODE_048FCF     ; $048FDA   |
    LDA $7C16,x         ; $048FDC   |
    CLC                 ; $048FDF   |
    ADC #$001C          ; $048FE0   |
    CMP #$0038          ; $048FE3   |
    BCS CODE_048FF4     ; $048FE6   |
    LDA $7C18,x         ; $048FE8   |
    CLC                 ; $048FEB   |
    ADC #$0021          ; $048FEC   |
    CMP #$0042          ; $048FEF   |
    BCC CODE_049063     ; $048FF2   |

CODE_048FF4:
    LDX #$09            ; $048FF4   |
    LDA #$9204          ; $048FF6   |
    JSL $7EDE44         ; $048FF9   | GSU init
    LDX $12             ; $048FFD   |
    LDA $300C           ; $048FFF   |
    CMP #$0007          ; $049002   |
    BPL CODE_049063     ; $049005   |
    LDX $12             ; $049007   |
    LDA $7360,x         ; $049009   |
    JSL $03A364         ; $04900C   |
    BCC CODE_04906B     ; $049010   |
    LDA $70E2,x         ; $049012   |
    STA $70E2,y         ; $049015   |
    CLC                 ; $049018   |
    ADC #$0008          ; $049019   |
    STA $7CD6,y         ; $04901C   |
    LDA $7182,x         ; $04901F   |
    STA $7182,y         ; $049022   |
    SEC                 ; $049025   |
    SBC #$0006          ; $049026   |
    STA $7978,y         ; $049029   |
    CLC                 ; $04902C   |
    ADC #$000E          ; $04902D   |
    STA $7CD8,y         ; $049030   |
    SEP #$20            ; $049033   |
    LDA $77C2,x         ; $049035   |
    STA $7400,y         ; $049038   |
    REP #$20            ; $04903B   |
    LDA #$FF00          ; $04903D   |
    STA $7222,y         ; $049040   |
    LDA #$0000          ; $049043   |
    STA $7542,y         ; $049046   |
    LDA #$0E80          ; $049049   |
    STA $6FA2,y         ; $04904C   |
    TYX                 ; $04904F   |
    LDY #$06            ; $049050   |
    STY $76,x           ; $049052   |
    JSL $048A18         ; $049054   |
    JSL $048A00         ; $049058   |
    LDA #$0076          ; $04905C   |\ play sound #$0076
    JSL $0085D2         ; $04905F   |/

CODE_049063:
    LDX $12             ; $049063   |
    LDA #$00C0          ; $049065   |
    STA $7A96,x         ; $049068   |

CODE_04906B:
    RTS                 ; $04906B   |

    LDA $7360,x         ; $04906C   |
    CMP #$001E          ; $04906F   |
    BEQ CODE_049086     ; $049072   |
    CMP #$0133          ; $049074   |
    BEQ CODE_049086     ; $049077   |
    CMP #$012A          ; $049079   |
    BEQ CODE_049086     ; $04907C   |
    CMP #$009B          ; $04907E   |
    BEQ CODE_049086     ; $049081   |
    CMP #$0074          ; $049083   |

CODE_049086:
    RTL                 ; $049086   |

    JSR CODE_048B20     ; $049087   |
    LDA #$0001          ; $04908A   |
    STA $7402,x         ; $04908D   |
    JMP CODE_04039F     ; $049090   |

    JSR CODE_04909B     ; $049094   |
    JSR CODE_0490AF     ; $049097   |
    RTL                 ; $04909A   |

CODE_04909B:
    LDA $61D6           ; $04909B   |
    CMP #$0087          ; $04909E   |
    BNE CODE_0490F0     ; $0490A1   |
    LDA #$FFFF          ; $0490A3   |
    STA $7E48           ; $0490A6   |
    BRA CODE_0490B4     ; $0490A9   |

DATA_0490AB:         dw $0100, $FF00

CODE_0490AF:
    LDA $61B2           ; $0490AF   |
    BPL CODE_0490F0     ; $0490B2   |

CODE_0490B4:
    LDA #$0010          ; $0490B4   |
    STA $6F00,x         ; $0490B7   |
    LDA #$0040          ; $0490BA   |
    STA $7AF6,x         ; $0490BD   |
    LDA #$0018          ; $0490C0   |
    STA $7A96,x         ; $0490C3   |
    LDA #$0004          ; $0490C6   |
    STA $16,x           ; $0490C9   |
    STZ $76,x           ; $0490CB   |
    LDA #$001E          ; $0490CD   |
    STA $7360,x         ; $0490D0   |
    LDA #$0001          ; $0490D3   |
    STA $7902,x         ; $0490D6   |
    STA $7D38,x         ; $0490D9   |
    ASL A               ; $0490DC   |
    EOR $60C4           ; $0490DD   |
    TAY                 ; $0490E0   |
    LDA $90AB,y         ; $0490E1   |
    STA $7220,x         ; $0490E4   |
    LDA #$FE00          ; $0490E7   |
    STA $7222,x         ; $0490EA   |
    STZ $0390           ; $0490ED   |

CODE_0490F0:
    RTS                 ; $0490F0   |

.init_stretch
    LDA #$0018          ; $0490F1   |
    STA $7A96,x         ; $0490F4   |
    LDA #$0004          ; $0490F7   |
    STA $16,x           ; $0490FA   |
    LDA $7900,x         ; $0490FC   |
    BPL CODE_049129     ; $0490FF   |
    JSL $03AD74         ; $049101   |
    BCC CODE_049132     ; $049105   |
    LDA $7900,x         ; $049107   |
    EOR #$FFFF          ; $04910A   |
    INC A               ; $04910D   |
    STA $7A36,x         ; $04910E   |
    LDA #$2079          ; $049111   |
    STA $7040,x         ; $049114   |
    LDA #$0002          ; $049117   |
    STA $7402,x         ; $04911A   |
    LDY #$06            ; $04911D   |
    STY $76,x           ; $04911F   |
    JSR CODE_04942A     ; $049121   |
    LDA $6020           ; $049124   |
    BRA CODE_049132     ; $049127   |

CODE_049129:
    LDA #$01FF          ; $049129   |
    STA $7A36,x         ; $04912C   |
    LDA #$001E          ; $04912F   |

CODE_049132:
    STA $7900,x         ; $049132   |
    JMP CODE_04048A     ; $049135   |

DATA_049139:         dw $8DA0
DATA_04913B:         dw $8E14
DATA_04913D:         dw $91A0
DATA_04913F:         dw $924A
DATA_049141:         dw $9276
DATA_049143:         dw $92C4
DATA_049145:         dw $9243

.main_stretch
    LDA $7722,x         ; $049147   |
    BMI CODE_049150     ; $04914A   |
    JSL $03AA52         ; $04914C   |

CODE_049150:
    LDA $6F00,x         ; $049150   |
    CMP #$0008          ; $049153   |
    BNE CODE_04916C     ; $049156   |
    LDY $74A2,x         ; $049158   |
    BPL CODE_04916C     ; $04915B   |
    LDA $7722,x         ; $04915D   |
    BMI CODE_04916C     ; $049160   |
    LDA $7A36,x         ; $049162   |
    EOR #$FFFF          ; $049165   |
    INC A               ; $049168   |
    STA $7900,x         ; $049169   |

CODE_04916C:
    JSL $03AF23         ; $04916C   |
    TXY                 ; $049170   |
    LDA $76,x           ; $049171   |
    ASL A               ; $049173   |
    TAX                 ; $049174   |
    JSR ($9139,x)       ; $049175   |

    STZ $02             ; $049178   |
    JSR CODE_049351     ; $04917A   |
    BCC CODE_049194     ; $04917D   |
    JSL $03AD74         ; $04917F   |
    BCC CODE_049194     ; $049183   |
    LDA #$2079          ; $049185   |
    STA $7040,x         ; $049188   |
    LDA #$0002          ; $04918B   |
    STA $7402,x         ; $04918E   |
    STA $76,x           ; $049191   |
    RTL                 ; $049193   |

CODE_049194:
    JMP CODE_040DC1     ; $049194   |

DATA_049198:         dw $FC00, $0400

DATA_04919C:         dw $FFF8, $0008

    TYX                 ; $0591A0   |
    PLA                 ; $0491A1   |
    LDA $7A36,x         ; $0491A2   |
    SEC                 ; $0491A5   |
    SBC #$0020          ; $0491A6   |
    CMP #$0020          ; $0491A9   |
    BPL CODE_0491B1     ; $0491AC   |
    LDA #$0020          ; $0491AE   |

CODE_0491B1:
    STA $7A36,x         ; $0491B1   |
    LDA $0036           ; $0491B4   |
    AND $6084           ; $0491B7   |
    BEQ CODE_0491C9     ; $0491BA   |
    LDA $60A8           ; $0491BC   |
    STA $78,x           ; $0491BF   |
    LDY #$05            ; $0491C1   |
    STY $76,x           ; $0491C3   |
    JSR CODE_049401     ; $0491C5   |
    RTL                 ; $0491C8   |

CODE_0491C9:
    JSR CODE_049306     ; $0491C9   |
    BCS CODE_0491D0     ; $0491CC   |
    INC $76,x           ; $0491CE   |

CODE_0491D0:
    LDA $7A36,x         ; $0491D0   |
    CMP #$0020          ; $0491D3   |
    BEQ CODE_049242     ; $0491D6   |
    LDA $7A98,x         ; $0491D8   |
    BNE CODE_049242     ; $0491DB   |
    LDA $7A36,x         ; $0491DD   |
    STA $300C           ; $0491E0   |
    LDA #$0005          ; $0491E3   |
    STA $3000           ; $0491E6   |
    LDX #$0B            ; $0491E9   |
    LDA #$86B6          ; $0491EB   |
    JSL $7EDE44         ; $0491EE   | GSU init
    LDX $12             ; $0491F2   |
    LDY $7400,x         ; $0491F4   |
    LDA $9198,y         ; $0491F7   |
    STA $00             ; $0491FA   |
    LDA $919C,y         ; $0491FC   |
    STA $02             ; $0491FF   |
    LDA #$0107          ; $049201   |
    JSL $03A364         ; $049204   |
    BCC CODE_049242     ; $049208   |
    LDA $70E2,x         ; $04920A   |
    CLC                 ; $04920D   |
    ADC $02             ; $04920E   |
    STA $70E2,y         ; $049210   |
    LDA $7182,x         ; $049213   |
    CLC                 ; $049216   |
    ADC #$0010          ; $049217   |
    SEC                 ; $04921A   |
    SBC $3000           ; $04921B   |
    STA $7182,y         ; $04921E   |
    LDA $00             ; $049221   |
    STA $7220,y         ; $049223   |
    LDA #$0001          ; $049226   |
    STA $7D38,y         ; $049229   |
    STA $7A38,y         ; $04922C   |
    LDA #$FFFF          ; $04922F   |
    STA $7862,y         ; $049232   |
    LDA #$0004          ; $049235   |
    STA $7A98,x         ; $049238   |
    LDA #$0045          ; $04923B   |\ play sound #$0045
    JSL $0085D2         ; $04923E   |/

CODE_049242:
    RTL                 ; $049242   |

    TYX                 ; $049243   |
    PLA                 ; $049244   |
    LDA #$0020          ; $049245   |
    BRA CODE_04924F     ; $049248   |

    TYX                 ; $04924A   |
    PLA                 ; $04924B   |
    LDA #$0080          ; $04924C   |

CODE_04924F:
    CLC                 ; $04924F   |
    ADC $7A36,x         ; $049250   |
    CMP #$01FF          ; $049253   |
    BMI CODE_049269     ; $049256   |
    LDA #$FE9A          ; $049258   |
    STA $7222,x         ; $04925B   |
    LDY #$04            ; $04925E   |
    STY $76,x           ; $049260   |
    LDA #$01FF          ; $049262   |
    STA $7A36,x         ; $049265   |
    RTL                 ; $049268   |

CODE_049269:
    STA $7A36,x         ; $049269   |
    JSR CODE_049306     ; $04926C   |
    BCC CODE_049275     ; $04926F   |
    LDY #$02            ; $049271   |
    STY $76,x           ; $049273   |

CODE_049275:
    RTL                 ; $049275   |

    TYX                 ; $049276   |
    PLA                 ; $049277   |
    LDA $7A36,x         ; $049278   |
    SEC                 ; $04927B   |
    SBC #$0010          ; $04927C   |
    CMP #$01FF          ; $04927F   |
    BPL CODE_0492B7     ; $049282   |
    STZ $7402,x         ; $049284   |
    LDA #$01FF          ; $049287   |
    STA $7A36,x         ; $04928A   |
    LDA #$001E          ; $04928D   |
    STA $7900,x         ; $049290   |
    JSL $03AEFD         ; $049293   |
    LDA #$1079          ; $049297   |
    STA $7040,x         ; $04929A   |
    LDA #$0018          ; $04929D   |
    STA $7A96,x         ; $0492A0   |
    LDA $10             ; $0492A3   |
    AND #$0001          ; $0492A5   |
    CLC                 ; $0492A8   |
    ADC #$0003          ; $0492A9   |
    STA $16,x           ; $0492AC   |
    STZ $7220,x         ; $0492AE   |
    STZ $7540,x         ; $0492B1   |
    STZ $76,x           ; $0492B4   |
    RTL                 ; $0492B6   |

CODE_0492B7:
    STA $7A36,x         ; $0492B7   |
    JSR CODE_049306     ; $0492BA   |
    BCC CODE_0492C3     ; $0492BD   |
    LDY #$02            ; $0492BF   |
    STY $76,x           ; $0492C1   |

CODE_0492C3:
    RTL                 ; $0492C3   |

    TYX                 ; $0492C4   |
    PLA                 ; $0492C5   |
    LDA $7A36,x         ; $0492C6   |
    CLC                 ; $0492C9   |
    ADC #$0060          ; $0492CA   |
    CMP #$01FF          ; $0492CD   |
    BMI CODE_0492FB     ; $0492D0   |
    LDA #$01FF          ; $0492D2   |
    STA $7A36,x         ; $0492D5   |
    LDA $78,x           ; $0492D8   |
    STA $60A8           ; $0492DA   |
    LDA #$F800          ; $0492DD   |
    STA $60AA           ; $0492E0   |
    LDA #$0006          ; $0492E3   |
    STA $60C0           ; $0492E6   |
    LDA #$8001          ; $0492E9   |
    STA $60D2           ; $0492EC   |
    INC $7E0A           ; $0492EF   |
    LDA #$FD34          ; $0492F2   |
    STA $7222,x         ; $0492F5   |
    DEC $76,x           ; $0492F8   |
    RTL                 ; $0492FA   |

CODE_0492FB:
    STA $7A36,x         ; $0492FB   |
    JSR CODE_049401     ; $0492FE   |
    RTL                 ; $049301   |

DATA_049302:         dw $0166, $FE9A

CODE_049306:
    JSR CODE_04942A     ; $049306   |
    LDA $7AF6,x         ; $049309   |
    BNE CODE_04932C     ; $04930C   |
    LDA $6020           ; $04930E   |
    PHA                 ; $049311   |
    SEC                 ; $049312   |
    SBC $7900,x         ; $049313   |
    SEC                 ; $049316   |
    SBC $72C2,x         ; $049317   |
    STA $02             ; $04931A   |
    PLA                 ; $04931C   |
    STA $7900,x         ; $04931D   |
    LDA $7C16,x         ; $049320   |
    CLC                 ; $049323   |
    ADC #$000E          ; $049324   |
    CMP #$001C          ; $049327   |
    BCC CODE_04932F     ; $04932A   |

CODE_04932C:
    JMP CODE_0493F7     ; $04932C   |

CODE_04932F:
    SEC                 ; $04932F   |
    SBC #$0004          ; $049330   |
    CMP #$0014          ; $049333   |
    BCC CODE_049365     ; $049336   |
    BPL CODE_04933F     ; $049338   |
    LDA #$0080          ; $04933A   |
    BRA CODE_049342     ; $04933D   |

CODE_04933F:
    LDA #$FF80          ; $04933F   |

CODE_049342:
    STA $60A8           ; $049342   |
    STA $60B4           ; $049345   |
    EOR #$FFFF          ; $049348   |
    INC A               ; $04934B   |
    STA $7220,x         ; $04934C   |
    BRA CODE_049365     ; $04934F   |

CODE_049351:
    LDA $7AF6,x         ; $049351   |
    BNE CODE_04932C     ; $049354   |
    LDA $7C16,x         ; $049356   |
    CLC                 ; $049359   |
    ADC #$000E          ; $04935A   |
    CMP #$001C          ; $04935D   |
    BCC CODE_049365     ; $049360   |
    JMP CODE_0493F7     ; $049362   |

CODE_049365:
    LDA $7900,x         ; $049365   |
    SEC                 ; $049368   |
    SBC #$0008          ; $049369   |
    STA $00             ; $04936C   |
    LDA $7182,x         ; $04936E   |
    SEC                 ; $049371   |
    SBC #$0008          ; $049372   |
    SEC                 ; $049375   |
    SBC $6090           ; $049376   |
    CLC                 ; $049379   |
    ADC $02             ; $04937A   |
    DEC A               ; $04937C   |
    CMP $7900,x         ; $04937D   |
    BPL CODE_0493F7     ; $049380   |
    CMP $00             ; $049382   |
    BMI CODE_0493C1     ; $049384   |
    LDY $60AB           ; $049386   |
    BMI CODE_0493F7     ; $049389   |
    LDY $0D94           ; $04938B   |
    BNE CODE_0493F7     ; $04938E   |
    CPX $61B6           ; $049390   |
    BEQ CODE_04939D     ; $049393   |
    LDY $61B6           ; $049395   |
    BNE CODE_0493F7     ; $049398   |
    STX $61B6           ; $04939A   |

CODE_04939D:
    STZ $7220,x         ; $04939D   |
    STZ $7540,x         ; $0493A0   |
    LDA $7182,x         ; $0493A3   |
    SEC                 ; $0493A6   |
    SBC #$0008          ; $0493A7   |
    SEC                 ; $0493AA   |
    SBC $7900,x         ; $0493AB   |
    STA $6090           ; $0493AE   |
    LDY #$00            ; $0493B1   |
    STY $608E           ; $0493B3   |
    STZ $60AA           ; $0493B6   |
    STZ $60D4           ; $0493B9   |
    INC $61B4           ; $0493BC   |
    SEC                 ; $0493BF   |
    RTS                 ; $0493C0   |

CODE_0493C1:
    DEC A               ; $0493C1   |
    CMP #$FFEC          ; $0493C2   |
    BCC CODE_0493F7     ; $0493C5   |
    LDY #$00            ; $0493C7   |
    LDA $7220,x         ; $0493C9   |
    BMI CODE_0493D0     ; $0493CC   |
    INY                 ; $0493CE   |
    INY                 ; $0493CF   |

CODE_0493D0:
    LDA $9302,y         ; $0493D0   |
    STA $7220,x         ; $0493D3   |
    EOR #$FFFF          ; $0493D6   |
    INC A               ; $0493D9   |
    CMP #$8000          ; $0493DA   |
    ROR A               ; $0493DD   |
    STA $60A8           ; $0493DE   |
    STA $60B4           ; $0493E1   |
    STZ $75E0,x         ; $0493E4   |
    LDA #$0008          ; $0493E7   |
    STA $7540,x         ; $0493EA   |
    JSL $03A858         ; $0493ED   |
    LDA #$0020          ; $0493F1   |
    STA $7AF6,x         ; $0493F4   |

CODE_0493F7:
    CPX $61B6           ; $0493F7   |
    BNE CODE_0493FF     ; $0493FA   |
    STZ $61B6           ; $0493FC   |

CODE_0493FF:
    CLC                 ; $0493FF   |
    RTS                 ; $049400   |

CODE_049401:
    JSR CODE_04942A     ; $049401   |
    STZ $7220,x         ; $049404   |
    STZ $7540,x         ; $049407   |
    LDA $7182,x         ; $04940A   |
    SEC                 ; $04940D   |
    SBC #$0008          ; $04940E   |
    SEC                 ; $049411   |
    SBC $6020           ; $049412   |
    STA $6090           ; $049415   |
    LDY #$00            ; $049418   |
    STY $608E           ; $04941A   |
    STZ $60A8           ; $04941D   |
    STZ $60B4           ; $049420   |
    STZ $60AA           ; $049423   |
    INC $61B4           ; $049426   |
    RTS                 ; $049429   |

CODE_04942A:
    LDA $7A36,x         ; $04942A   |
    STA $3016           ; $04942D   |
    SEC                 ; $049430   |
    SBC #$0100          ; $049431   |
    BMI CODE_049439     ; $049434   |
    LSR A               ; $049436   |
    LSR A               ; $049437   |
    LSR A               ; $049438   |

CODE_049439:
    EOR #$FFFF          ; $049439   |
    INC A               ; $04943C   |
    CLC                 ; $04943D   |
    ADC #$0100          ; $04943E   |
    STA $3008           ; $049441   |
    LDA #$0F00          ; $049444   |
    STA $300C           ; $049447   |
    LDA #$0008          ; $04944A   |
    STA $3010           ; $04944D   |
    ASL A               ; $049450   |
    STA $3012           ; $049451   |
    LDA #$0054          ; $049454   |
    STA $301A           ; $049457   |
    LDA #$7020          ; $04945A   |
    STA $3018           ; $04945D   |
    LDY $7722,x         ; $049460   |
    TYX                 ; $049463   |
    LDA $03A9CE,x       ; $049464   |
    STA $3006           ; $049468   |
    LDA $03A9EE,x       ; $04946B   |
    STA $3004           ; $04946F   |
    LDX #$08            ; $049472   |
    LDA #$D76B          ; $049474   |
    JSL $7EDE44         ; $049477   | GSU init
    LDX $12             ; $04947B   |
    INC $0CF9           ; $04947D   |
    RTS                 ; $049480   |

.init_mufti_guy
    JSL $048A18         ; $049481   |
    LDA #$0020          ; $049485   |
    STA $7042,x         ; $049488   |
    RTL                 ; $04948B   |

DATA_04948C:         dw $951E
DATA_04948E:         dw $958F

.main_mufti_guy
    JSR CODE_0494EB     ; $049490   |
    LDA $6F00,x         ; $049493   |
    CMP #$0008          ; $049496   |
    BNE CODE_0494D2     ; $049499   |
    JSR CODE_0496A6     ; $04949B   |
    LDA $7902,x         ; $04949E   |
    PHA                 ; $0494A1   |
    LDA $74A0,x         ; $0494A2   |
    PHA                 ; $0494A5   |
    STZ $6F00,x         ; $0494A6   |
    TXY                 ; $0494A9   |
    LDA #$001E          ; $0494AA   |
    JSL $03A366         ; $0494AD   |
    PLA                 ; $0494B1   |
    SEP #$20            ; $0494B2   |
    STA $74A0,x         ; $0494B4   |
    REP #$20            ; $0494B7   |
    PLA                 ; $0494B9   |
    STA $7902,x         ; $0494BA   |
    AND #$00FE          ; $0494BD   |
    ORA #$0020          ; $0494C0   |
    STA $7042,x         ; $0494C3   |
    LDA #$0020          ; $0494C6   |
    STA $7AF6,x         ; $0494C9   |
    LDA #$0008          ; $0494CC   |
    STA $6F00,x         ; $0494CF   |

CODE_0494D2:
    JSL $03AF23         ; $0494D2   |
    TXY                 ; $0494D6   |
    LDA $76,x           ; $0494D7   |
    ASL A               ; $0494D9   |
    TAX                 ; $0494DA   |
    JSR ($948C,x)       ; $0494DB   |

    JSR CODE_0495DD     ; $0494DE   |
    RTL                 ; $0494E1   |

DATA_0494E2:         db $10, $10, $10, $10, $08, $20, $20, $FF
DATA_0494EA:         db $FF

CODE_0494EB:
    LDY $7402,x         ; $0494EB   |
    LDA $94E2,y         ; $0494EE   |
    TAY                 ; $0494F1   |
    BMI CODE_04950A     ; $0494F2   |
    REP #$10            ; $0494F4   |
    TYA                 ; $0494F6   |
    CLC                 ; $0494F7   |
    ADC $7362,x         ; $0494F8   |
    TAY                 ; $0494FB   |
    LDA $6005,y         ; $0494FC   |
    AND #$FFF1          ; $0494FF   |
    ORA $7902,x         ; $049502   |
    STA $6005,y         ; $049505   |
    SEP #$10            ; $049508   |

CODE_04950A:
    RTS                 ; $04950A   |

DATA_04950B:         dw $FFA7, $0059, $FEF4, $010C

DATA_049513:         dw $0005, $000B

DATA_049517:         db $05, $06, $07, $08, $07, $06, $05

    TYX                 ; $04951E   |
    LDA $7A98,x         ; $04951F   |
    BNE CODE_049553     ; $049522   |
    LDA #$0004          ; $049524   |
    STA $7A98,x         ; $049527   |
    INC $18,x           ; $04952A   |
    LDY $18,x           ; $04952C   |
    LDA $9517,y         ; $04952E   |
    AND #$00FF          ; $049531   |
    STA $7402,x         ; $049534   |
    CPY #$03            ; $049537   |
    BNE CODE_049554     ; $049539   |
    LDA #$0040          ; $04953B   |
    STA $7A98,x         ; $04953E   |
    LDY $77C2,x         ; $049541   |
    LDA $10             ; $049544   |
    BIT #$0001          ; $049546   |
    BNE CODE_04954F     ; $049549   |
    AND #$0002          ; $04954B   |
    TAY                 ; $04954E   |

CODE_04954F:
    TYA                 ; $04954F   |
    STA $7400,x         ; $049550   |

CODE_049553:
    RTS                 ; $049553   |

CODE_049554:
    CPY #$07            ; $049554   |
    BNE CODE_049587     ; $049556   |
    LDY $7400,x         ; $049558   |
    LDA $950B,y         ; $04955B   |
    STA $75E0,x         ; $04955E   |
    TYA                 ; $049561   |
    LSR A               ; $049562   |
    AND #$FFFE          ; $049563   |
    TAY                 ; $049566   |
    LDA $9513,y         ; $049567   |
    STA $7540,x         ; $04956A   |
    LDA $10             ; $04956D   |
    AND #$003F          ; $04956F   |
    CLC                 ; $049572   |
    ADC #$0040          ; $049573   |
    STA $7A96,x         ; $049576   |
    LDA #$0003          ; $049579   |
    STA $7402,x         ; $04957C   |
    INC A               ; $04957F   |
    STA $7A98,x         ; $049580   |
    STZ $18,x           ; $049583   |
    INC $76,x           ; $049585   |

CODE_049587:
    RTS                 ; $049587   |

DATA_049588:         db $03, $04, $03, $02, $00, $01, $02

    TYX                 ; $04958F   |
    LDA $7A98,x         ; $049590   |
    BNE CODE_0495DC     ; $049593   |
    LDA #$0004          ; $049595   |
    LDY $7540,x         ; $049598   |
    CPY #$05            ; $04959B   |
    BEQ CODE_0495A0     ; $04959D   |
    LSR A               ; $04959F   |

CODE_0495A0:
    STA $7A98,x         ; $0495A0   |
    INC $18,x           ; $0495A3   |
    LDY $18,x           ; $0495A5   |
    CPY #$07            ; $0495A7   |
    BMI CODE_0495AF     ; $0495A9   |
    STZ $18,x           ; $0495AB   |
    LDY #$00            ; $0495AD   |

CODE_0495AF:
    LDA $7402,x         ; $0495AF   |
    CMP #$0003          ; $0495B2   |
    BNE CODE_0495D3     ; $0495B5   |
    LDA $7A96,x         ; $0495B7   |
    BNE CODE_0495D3     ; $0495BA   |
    LDA #$0005          ; $0495BC   |
    STA $7402,x         ; $0495BF   |
    LDA #$0004          ; $0495C2   |
    STA $7A98,x         ; $0495C5   |
    STZ $18,x           ; $0495C8   |
    STZ $7540,x         ; $0495CA   |
    STZ $7220,x         ; $0495CD   |
    STZ $76,x           ; $0495D0   |
    RTS                 ; $0495D2   |

CODE_0495D3:
    LDA $9588,y         ; $0495D3   |
    AND #$00FF          ; $0495D6   |
    STA $7402,x         ; $0495D9   |

CODE_0495DC:
    RTS                 ; $0495DC   |

CODE_0495DD:
    LDY $7D36,x         ; $0495DD   |
    BPL CODE_04963F     ; $0495E0   |
    LDA $7C18,x         ; $0495E2   |
    SEC                 ; $0495E5   |
    SBC $6122           ; $0495E6   |
    SEC                 ; $0495E9   |
    SBC $7BB8,x         ; $0495EA   |
    CMP #$FFF8          ; $0495ED   |
    BCC CODE_04963A     ; $0495F0   |
    LDY $60AB           ; $0495F2   |
    BMI CODE_0495DC     ; $0495F5   |
    LDY $60C0           ; $0495F7   |
    BEQ CODE_0495DC     ; $0495FA   |
    LDA #$FC00          ; $0495FC   |
    STA $60AA           ; $0495FF   |
    LDA #$0006          ; $049602   |
    STA $60C0           ; $049605   |
    LDA #$8001          ; $049608   |
    STA $60D2           ; $04960B   |
    JSR CODE_0496A6     ; $04960E   |
    LDA $7902,x         ; $049611   |
    PHA                 ; $049614   |
    LDA $74A0,x         ; $049615   |
    PHA                 ; $049618   |
    STZ $6F00,x         ; $049619   |
    TXY                 ; $04961C   |
    LDA #$001E          ; $04961D   |
    JSL $03A34E         ; $049620   |
    PLA                 ; $049624   |
    SEP #$20            ; $049625   |
    STA $74A0,x         ; $049627   |
    REP #$20            ; $04962A   |
    PLA                 ; $04962C   |
    STA $7902,x         ; $04962D   |
    AND #$FFFE          ; $049630   |
    ORA #$0020          ; $049633   |
    STA $7042,x         ; $049636   |
    RTS                 ; $049639   |

CODE_04963A:
    JSL $03A858         ; $04963A   |
    RTS                 ; $04963E   |

CODE_04963F:
    DEY                 ; $04963F   |
    BMI CODE_0496A5     ; $049640   |
    LDA $6F00,y         ; $049642   |
    CMP #$0010          ; $049645   |
    BNE CODE_0496A5     ; $049648   |
    LDA $7D38,y         ; $04964A   |
    BEQ CODE_0496A5     ; $04964D   |
    LDA $7220,y         ; $04964F   |
    PHP                 ; $049652   |
    LDA #$FE00          ; $049653   |
    PLP                 ; $049656   |
    BMI CODE_04965C     ; $049657   |
    LDA #$0200          ; $049659   |

CODE_04965C:
    STA $0E             ; $04965C   |
    TYX                 ; $04965E   |
    JSL $03B24B         ; $04965F   |
    BCC CODE_04966C     ; $049663   |
    LDA #$4E00          ; $049665   |
    STA $6FA0,x         ; $049668   |
    RTS                 ; $04966B   |

CODE_04966C:
    JSR CODE_0496A6     ; $04966C   |
    LDA $7902,x         ; $04966F   |
    PHA                 ; $049672   |
    LDA $74A0,x         ; $049673   |
    PHA                 ; $049676   |
    STZ $6F00,x         ; $049677   |
    TXY                 ; $04967A   |
    LDA #$001E          ; $04967B   |
    JSL $03A366         ; $04967E   |
    PLA                 ; $049682   |
    SEP #$20            ; $049683   |
    STA $74A0,x         ; $049685   |
    REP #$20            ; $049688   |
    PLA                 ; $04968A   |
    STA $7902,x         ; $04968B   |
    AND #$FFFE          ; $04968E   |
    ORA #$0020          ; $049691   |
    STA $7042,x         ; $049694   |
    LDA $0E             ; $049697   |
    STA $7220,x         ; $049699   |
    INC $7D38,x         ; $04969C   |
    LDA #$0020          ; $04969F   |
    STA $7AF6,x         ; $0496A2   |

CODE_0496A5:
    RTS                 ; $0496A5   |

CODE_0496A6:
    LDA #$0210          ; $0496A6   |
    JSL $008B21         ; $0496A9   |
    LDA $7CD6,x         ; $0496AD   |
    STA $70A2,y         ; $0496B0   |
    LDA $7CD8,x         ; $0496B3   |
    STA $7142,y         ; $0496B6   |
    LDA #$0001          ; $0496B9   |
    STA $7782,y         ; $0496BC   |
    LDA #$0017          ; $0496BF   |
    STA $73C2,y         ; $0496C2   |
    LDA #$0022          ; $0496C5   |
    STA $7002,y         ; $0496C8   |
    RTS                 ; $0496CB   |

.init_lunge_fish
    LDA $7182,x         ; $0496CC   |
    STA $7A36,x         ; $0496CF   |
    SEC                 ; $0496D2   |
    SBC #$0020          ; $0496D3   |
    STA $7182,x         ; $0496D6   |
    LDA #$0010          ; $0496D9   |
    STA $7900,x         ; $0496DC   |
    LDA $70E2,x         ; $0496DF   |
    STA $7902,x         ; $0496E2   |
    RTL                 ; $0496E5   |

lunge_fish_state_ptr:
DATA_0496E6:         dw $978A                ; state 00
DATA_0496E8:         dw $97AD                ; state 01
DATA_0496EA:         dw $97C6                ; state 02
DATA_0496EC:         dw $9896                ; state 03
DATA_0496EE:         dw $9991                ; state 04
DATA_0496F0:         dw $99F2                ; state 05
DATA_0496F2:         dw $9A11                ; state 06
DATA_0496F4:         dw $9A21                ; state 07
DATA_0496F6:         dw $9A45                ; state 08
DATA_0496F8:         dw $9A61                ; state 09

.main_lunge_fish
    JSL $03AF23         ; $0496FA   |
    TXY                 ; $0496FE   |
    LDA $76,x           ; $0496FF   |
    ASL A               ; $049701   |
    TAX                 ; $049702   |
    JSR ($96E6,x)       ; $049703   |
    JSR CODE_04970A     ; $049706   |
    RTL                 ; $049709   |

; lunge fish sub

CODE_04970A:
    LDY $74A2,x         ; $04970A   |
    BMI CODE_049755     ; $04970D   |
    LDY $76,x           ; $04970F   |
    CPY #$04            ; $049711   |
    BMI CODE_049719     ; $049713   |
    CPY #$07            ; $049715   |
    BMI CODE_049755     ; $049717   |

CODE_049719:
    LDY $7D36,x         ; $049719   |
    BEQ CODE_049755     ; $04971C   |
    BPL CODE_049756     ; $04971E   |
    LDA $7C18,x         ; $049720   |
    SEC                 ; $049723   |
    SBC $6122           ; $049724   |
    SEC                 ; $049727   |
    SBC $7BB8,x         ; $049728   |
    CMP #$FFF8          ; $04972B   |
    BCC CODE_049751     ; $04972E   |
    LDY $60AB           ; $049730   |
    BMI CODE_049755     ; $049733   |
    LDY $60C0           ; $049735   |
    BEQ CODE_049755     ; $049738   |
    LDA #$FA00          ; $04973A   |
    STA $60AA           ; $04973D   |
    LDA #$0006          ; $049740   |
    STA $60C0           ; $049743   |
    LDA #$8001          ; $049746   |
    STA $60D2           ; $049749   |
    STZ $60D4           ; $04974C   |
    BRA CODE_049770     ; $04974F   |

CODE_049751:
    JSL $03A858         ; $049751   |

CODE_049755:
    RTS                 ; $049755   |

CODE_049756:
    LDA $6EFF,y         ; $049756   |
    CMP #$0010          ; $049759   |
    BNE CODE_049789     ; $04975C   |
    LDA $7D37,y         ; $04975E   |
    BEQ CODE_049789     ; $049761   |
    DEY                 ; $049763   |
    TYX                 ; $049764   |
    JSL $03B25B         ; $049765   |
    LDY $7402,x         ; $049769   |
    CPY #$02            ; $04976C   |
    BEQ CODE_049789     ; $04976E   |

CODE_049770:
    STZ $7220,x         ; $049770   |
    STZ $7222,x         ; $049773   |
    STZ $7542,x         ; $049776   |
    LDA #$0040          ; $049779   |
    STA $7A96,x         ; $04977C   |
    LDA #$0002          ; $04977F   |
    STA $7402,x         ; $049782   |
    LDY #$07            ; $049785   |
    STY $76,x           ; $049787   |

CODE_049789:
    RTS                 ; $049789   |

; lunge fish state 00
    TYX                 ; $04978A   |
    LDA $7A96,x         ; $04978B   |
    BNE CODE_0497A5     ; $04978E   |
    LDA $7C16,x         ; $049790   |
    CLC                 ; $049793   |
    ADC #$0080          ; $049794   |
    CMP #$0100          ; $049797   |
    BCS CODE_0497A5     ; $04979A   |
    LDA #$0400          ; $04979C   |
    STA $7222,x         ; $04979F   |
    INC $76,x           ; $0497A2   |

CODE_0497A4:
    RTS                 ; $0497A4   |

CODE_0497A5:
    JSL $03A2F8         ; $0497A5   |
    BCC CODE_0497A4     ; $0497A9   |
    PLA                 ; $0497AB   | \
    RTL                 ; $0497AC   | /  back out of sprite

; lunge fish state 01
    TYX                 ; $0497AD   |
    JSR CODE_049943     ; $0497AE   |
    BPL CODE_0497BD     ; $0497B1   |
    LDA #$0040          ; $0497B3   |
    STA $7A96,x         ; $0497B6   |
    STZ $16,x           ; $0497B9   |
    INC $76,x           ; $0497BB   |

CODE_0497BD:
    RTS                 ; $0497BD   |

DATA_0497BE:         dw $0020
DATA_0497C0:         dw $FFE0
DATA_0497C2:         dw $FF00
DATA_0497C4:         dw $0100

; lunge fish state 02
    TYX                 ; $0497C6   |
    LDA $7A96,x         ; $0497C7   |
    BNE CODE_0497BD     ; $0497CA   |
    LDY #$00            ; $0497CC   |
    LDA $60A8           ; $0497CE   |
    BMI CODE_0497E0     ; $0497D1   |
    BNE CODE_0497DE     ; $0497D3   |
    LDA $60C4           ; $0497D5   |
    EOR #$0002          ; $0497D8   |
    TAY                 ; $0497DB   |
    BRA CODE_0497E0     ; $0497DC   |

CODE_0497DE:
    INY                 ; $0497DE   |
    INY                 ; $0497DF   |

CODE_0497E0:
    LDA $608C           ; $0497E0   |
    CLC                 ; $0497E3   |
    ADC $97BE,y         ; $0497E4   |
    STA $70E2,x         ; $0497E7   |
    LDA $7900,x         ; $0497EA   |
    LSR A               ; $0497ED   |
    CLC                 ; $0497EE   |
    ADC $70E2,x         ; $0497EF   |
    SEC                 ; $0497F2   |
    SBC $7902,x         ; $0497F3   |
    STA $02             ; $0497F6   |
    CMP $7900,x         ; $0497F8   |
    BCC CODE_049831     ; $0497FB   |
    BMI CODE_049808     ; $0497FD   |
    LDA $7902,x         ; $0497FF   |
    CLC                 ; $049802   |
    ADC $7900,x         ; $049803   |
    BRA CODE_04980F     ; $049806   |

CODE_049808:
    LDA $7902,x         ; $049808   |
    SEC                 ; $04980B   |
    SBC $7900,x         ; $04980C   |

CODE_04980F:
    STA $70E2,x         ; $04980F   |
    LDY $77C2,x         ; $049812   |
    LDA $00             ; $049815   |
    CLC                 ; $049817   |
    ADC #$0100          ; $049818   |
    STA $00             ; $04981B   |
    LDA $02             ; $04981D   |
    CLC                 ; $04981F   |
    ADC #$0080          ; $049820   |
    CMP $00             ; $049823   |
    BCC CODE_049831     ; $049825   |
    STZ $7402,x         ; $049827   |
    LDA #$0008          ; $04982A   |
    STA $76,x           ; $04982D   |
    BRA CODE_04987D     ; $04982F   |

CODE_049831:
    LDA $7C18,x         ; $049831   |
    CMP #$0040          ; $049834   |
    BMI CODE_049858     ; $049837   |
    INC $16,x           ; $049839   |
    LDA $7976,x         ; $04983B   |
    CMP #$0080          ; $04983E   |
    BMI CODE_04988D     ; $049841   |
    STZ $7402,x         ; $049843   |
    LDA #$0060          ; $049846   |
    STA $7A96,x         ; $049849   |
    LDY #$09            ; $04984C   |
    STY $76,x           ; $04984E   |
    LDY $77C2,x         ; $049850   |
    LDA #$FF00          ; $049853   |
    BRA CODE_049880     ; $049856   |

CODE_049858:
    LDA $97C2,y         ; $049858   |
    STA $7220,x         ; $04985B   |
    LDA #$0020          ; $04985E   |
    STA $7542,x         ; $049861   |
    LDA #$0340          ; $049864   |
    STA $75E2,x         ; $049867   |
    LDA #$0001          ; $04986A   |
    STA $7402,x         ; $04986D   |
    STZ $18,x           ; $049870   |
    PHY                 ; $049872   |
    LDA #$0083          ; $049873   |\ play sound #$0083
    JSL $0085D2         ; $049876   |/
    PLY                 ; $04987A   |
    INC $76,x           ; $04987B   |

CODE_04987D:
    LDA #$FCC0          ; $04987D   |

CODE_049880:
    STA $7222,x         ; $049880   |
    TYA                 ; $049883   |
    STA $7400,x         ; $049884   |
    LDA #$0002          ; $049887   |
    STA $74A2,x         ; $04988A   |

CODE_04988D:
    RTS                 ; $04988D   |

DATA_04988E:         dw $0020
DATA_049890:         dw $FFE0
DATA_049892:         dw $0180
DATA_049894:         dw $FE80

; lunge fish state 03
    TYX                 ; $049896   |
    LDY $7223,x         ; $049897   |
    BMI CODE_0498A5     ; $04989A   |
    LDA #$0002          ; $04989C   |
    STA $7402,x         ; $04989F   |
    JMP CODE_049931     ; $0498A2   |

CODE_0498A5:
    JSR CODE_049AA4     ; $0498A5   |
    LDA $7400,x         ; $0498A8   |
    DEC A               ; $0498AB   |
    EOR $7C16,x         ; $0498AC   |
    BPL CODE_0498F0     ; $0498AF   |
    LDA $7C16,x         ; $0498B1   |
    CLC                 ; $0498B4   |
    ADC #$0010          ; $0498B5   |
    CMP #$0020          ; $0498B8   |
    BCS CODE_0498F0     ; $0498BB   |
    LDA $7C18,x         ; $0498BD   |
    CLC                 ; $0498C0   |
    ADC #$0030          ; $0498C1   |
    CMP #$0040          ; $0498C4   |
    BCS CODE_0498F0     ; $0498C7   |
    JSL $04F74A         ; $0498C9   |
    LDA #$001A          ; $0498CD   |
    STA $60AC           ; $0498D0   |
    LDA #$006B          ; $0498D3   |
    STA $60BE           ; $0498D6   |
    STA $0B48           ; $0498D9   |
    LDA $7C16,x         ; $0498DC   |
    STA $78,x           ; $0498DF   |
    LDA $7182,x         ; $0498E1   |
    SEC                 ; $0498E4   |
    SBC $6090           ; $0498E5   |
    STA $7A38,x         ; $0498E8   |
    INC $18,x           ; $0498EB   |
    INC $76,x           ; $0498ED   |
    RTS                 ; $0498EF   |

CODE_0498F0:
    LDA $7400,x         ; $0498F0   |
    TAY                 ; $0498F3   |
    DEC A               ; $0498F4   |
    EOR $7C16,x         ; $0498F5   |
    BPL CODE_049931     ; $0498F8   |
    LDA $7C16,x         ; $0498FA   |
    CLC                 ; $0498FD   |
    ADC #$0012          ; $0498FE   |
    CMP #$0024          ; $049901   |
    BCS CODE_049931     ; $049904   |
    LDA $7C18,x         ; $049906   |
    CLC                 ; $049909   |
    ADC #$0018          ; $04990A   |
    CMP #$0030          ; $04990D   |
    BCS CODE_049931     ; $049910   |
    LDA $988E,y         ; $049912   |
    CLC                 ; $049915   |
    ADC $60A8           ; $049916   |
    STA $60A8           ; $049919   |
    STA $60B4           ; $04991C   |
    CLC                 ; $04991F   |
    ADC #$0180          ; $049920   |
    CMP #$0300          ; $049923   |
    BCC CODE_049931     ; $049926   |
    LDA $9892,y         ; $049928   |
    STA $60A8           ; $04992B   |
    STA $60B4           ; $04992E   |

CODE_049931:
    JSR CODE_049943     ; $049931   |
    BPL CODE_049942     ; $049934   |
    LDA #$00A0          ; $049936   |
    STA $7A96,x         ; $049939   |
    STZ $16,x           ; $04993C   |
    LDY #$02            ; $04993E   |
    STY $76,x           ; $049940   |

CODE_049942:
    RTS                 ; $049942   |

; lunge fish sub

CODE_049943:
    LDA $7A36,x         ; $049943   |
    CMP $7182,x         ; $049946   |
    BPL CODE_049990     ; $049949   |
    STA $7182,x         ; $04994B   |
    LDA #$01CE          ; $04994E   |
    JSL $008B21         ; $049951   |
    LDA #$0001          ; $049955   |
    STA $7E4C,y         ; $049958   |
    LDA #$FE00          ; $04995B   |
    STA $71E2,y         ; $04995E   |
    LDA #$0012          ; $049961   |
    STA $7782,y         ; $049964   |
    LDA $70E2,x         ; $049967   |
    STA $70A2,y         ; $04996A   |
    LDA $7182,x         ; $04996D   |
    SEC                 ; $049970   |
    SBC #$0010          ; $049971   |
    STA $7142,y         ; $049974   |
    STZ $7220,x         ; $049977   |
    STZ $7222,x         ; $04997A   |
    STZ $7542,x         ; $04997D   |
    STZ $75E2,x         ; $049980   |
    LDA #$005F          ; $049983   |\ play sound #$005F
    JSL $0085D2         ; $049986   |/
    LDA #$FFFF          ; $04998A   |
    STA $74A2,x         ; $04998D   |

CODE_049990:
    RTS                 ; $049990   |

; lunge fish state 04
    TYX                 ; $049991   |
    LDA $70E2,x         ; $049992   |
    STA $00             ; $049995   |
    LDA $7182,x         ; $049997   |
    STA $02             ; $04999A   |
    LDA $78,x           ; $04999C   |
    STA $04             ; $04999E   |
    LDA $7A38,x         ; $0499A0   |
    STA $06             ; $0499A3   |
    JSL $049B42         ; $0499A5   |
    STA $0C             ; $0499A9   |
    LDA $04             ; $0499AB   |
    STA $78,x           ; $0499AD   |
    LDA $06             ; $0499AF   |
    STA $7A38,x         ; $0499B1   |
    LDA $08             ; $0499B4   |
    STA $608C           ; $0499B6   |
    LDA $0A             ; $0499B9   |
    STA $6090           ; $0499BB   |
    LDA $0C             ; $0499BE   |
    BNE CODE_0499D2     ; $0499C0   |
    STZ $7402,x         ; $0499C2   |
    LDA $7182,x         ; $0499C5   |
    CLC                 ; $0499C8   |
    ADC #$0020          ; $0499C9   |
    STA $6090           ; $0499CC   |
    INC $76,x           ; $0499CF   |
    RTS                 ; $0499D1   |

CODE_0499D2:
    JSR CODE_049943     ; $0499D2   |
    BPL CODE_0499F1     ; $0499D5   |
    LDA $70E2,x         ; $0499D7   |
    STA $608C           ; $0499DA   |
    LDA $7182,x         ; $0499DD   |
    CLC                 ; $0499E0   |
    ADC #$0020          ; $0499E1   |
    STA $6090           ; $0499E4   |
    LDA #$0020          ; $0499E7   |
    STA $7A98,x         ; $0499EA   |
    LDY #$06            ; $0499ED   |
    STY $76,x           ; $0499EF   |

CODE_0499F1:
    RTS                 ; $0499F1   |

; lunge fish state 05
    TYX                 ; $0499F2   |
    LDA $70E2,x         ; $0499F3   |
    STA $608C           ; $0499F6   |
    LDA $7182,x         ; $0499F9   |
    CLC                 ; $0499FC   |
    ADC #$0020          ; $0499FD   |
    STA $6090           ; $049A00   |
    JSR CODE_049943     ; $049A03   |
    BPL CODE_049A10     ; $049A06   |
    LDA #$0020          ; $049A08   |
    STA $7A98,x         ; $049A0B   |
    INC $76,x           ; $049A0E   |

CODE_049A10:
    RTS                 ; $049A10   |

; lunge fish state 06
    TYX                 ; $049A11   |
    LDA $7A98,x         ; $049A12   |
    BNE CODE_049A10     ; $049A15   |
    REP #$10            ; $049A17   |
    JSL $04AC9C         ; $049A19   |
    SEP #$10            ; $049A1D   |
    PLA                 ; $049A1F   | \
    RTL                 ; $049A20   | / back out of sprite

; lunge fish state 07
    TYX                 ; $049A21   |
    LDA $7A96,x         ; $049A22   |
    BNE CODE_049A44     ; $049A25   |
    LDA #$0020          ; $049A27   |
    STA $7542,x         ; $049A2A   |
    LDA #$0340          ; $049A2D   |
    STA $75E2,x         ; $049A30   |
    JSR CODE_049943     ; $049A33   |
    BPL CODE_049A44     ; $049A36   |
    LDA #$00A0          ; $049A38   |
    STA $7A96,x         ; $049A3B   |
    STZ $16,x           ; $049A3E   |
    LDY #$02            ; $049A40   |
    STY $76,x           ; $049A42   |

CODE_049A44:
    RTS                 ; $049A44   |

; lunge fish state 08
    TYX                 ; $049A45   |
    LDA $7A36,x         ; $049A46   |
    SEC                 ; $049A49   |
    SBC #$0020          ; $049A4A   |
    CMP $7182,x         ; $049A4D   |
    BMI CODE_049A60     ; $049A50   |
    STA $7182,x         ; $049A52   |
    STZ $7222,x         ; $049A55   |
    LDA #$0040          ; $049A58   |
    STA $7A96,x         ; $049A5B   |
    STZ $76,x           ; $049A5E   |

CODE_049A60:
    RTS                 ; $049A60   |

; lunge fish state 09
    TYX                 ; $049A61   |
    LDA $7A36,x         ; $049A62   |
    SEC                 ; $049A65   |
    SBC #$0008          ; $049A66   |
    CMP $7182,x         ; $049A69   |
    BMI CODE_049A83     ; $049A6C   |
    STA $7182,x         ; $049A6E   |
    STZ $7222,x         ; $049A71   |
    LDA $7A96,x         ; $049A74   |
    BNE CODE_049A83     ; $049A77   |
    LDA #$0400          ; $049A79   |
    STA $7222,x         ; $049A7C   |
    LDY #$01            ; $049A7F   |
    STY $76,x           ; $049A81   |

CODE_049A83:
    RTS                 ; $049A83   |

DATA_049A84:         dw $0028
DATA_049A86:         dw $0030
DATA_049A88:         dw $0038
DATA_049A8A:         dw $003F
DATA_049A8C:         dw $FFD8
DATA_049A8E:         dw $FFD0
DATA_049A90:         dw $FFC8
DATA_049A92:         dw $FFC1

DATA_049A94:         dw $002C
DATA_049A96:         dw $0028
DATA_049A98:         dw $0034
DATA_049A9A:         dw $0000
DATA_049A9C:         dw $0008
DATA_049A9E:         dw $0010
DATA_049AA0:         dw $0018
DATA_049AA2:         dw $0020

; lunge fish sub

CODE_049AA4:
    LDA $10             ; $049AA4   |
    AND #$0003          ; $049AA6   |
    STA $00             ; $049AA9   |
    LDA $7400,x         ; $049AAB   |
    ASL A               ; $049AAE   |
    CLC                 ; $049AAF   |
    ADC $00             ; $049AB0   |
    ASL A               ; $049AB2   |
    TAY                 ; $049AB3   |
    LDA $9A84,y         ; $049AB4   |
    STA $00             ; $049AB7   |
    LDA $11             ; $049AB9   |
    AND #$000E          ; $049ABB   |
    TAY                 ; $049ABE   |
    LDA $9A94,y         ; $049ABF   |
    STA $02             ; $049AC2   |
    LDA #$01CF          ; $049AC4   |
    JSL $008B21         ; $049AC7   |
    LDA #$0010          ; $049ACB   |
    STA $7782,y         ; $049ACE   |
    LDA $70E2,x         ; $049AD1   |
    SEC                 ; $049AD4   |
    SBC $00             ; $049AD5   |
    STA $70A2,y         ; $049AD7   |
    LDA $7182,x         ; $049ADA   |
    SEC                 ; $049ADD   |
    SBC $02             ; $049ADE   |
    STA $7142,y         ; $049AE0   |
    TXA                 ; $049AE3   |
    STA $7E4C,y         ; $049AE4   |
    LDA $00             ; $049AE7   |
    STA $7E8C,y         ; $049AE9   |
    LDA $02             ; $049AEC   |
    STA $7E4E,y         ; $049AEE   |
    RTS                 ; $049AF1   |

DATA_049AF2:         db $00, $00, $01, $02
DATA_049AF6:         db $03, $04, $05, $05
DATA_049AFA:         db $06, $07, $08, $09
DATA_049AFE:         db $0A, $0B, $0B, $0C
DATA_049B02:         db $0D, $0E, $0F, $10
DATA_049B06:         db $11, $12, $12, $13
DATA_049B0A:         db $14, $15, $16, $17
DATA_049B0E:         db $18, $19, $1A, $1B
DATA_049B12:         db $1B, $1C, $1D, $1E
DATA_049B16:         db $1F, $20, $21, $22
DATA_049B1A:         db $23, $24, $25, $26
DATA_049B1E:         db $27, $28, $29, $2A
DATA_049B22:         db $2B, $2C, $2D, $2D
DATA_049B26:         db $2E, $2F, $30, $31
DATA_049B2A:         db $32, $33, $34, $35
DATA_049B2E:         db $36, $37, $38, $39
DATA_049B32:         db $3A, $3B, $3C, $3D
DATA_049B36:         db $3E, $3F, $40, $41
DATA_049B3A:         db $42, $43, $44, $45
DATA_049B3E:         db $46, $47, $48, $49

; lunge fish sub
    PHB                 ; $049B42   |
    PHK                 ; $049B43   |
    PLB                 ; $049B44   |
    LDA $00             ; $049B45   |
    SEC                 ; $049B47   |
    SBC $04             ; $049B48   |
    STA $08             ; $049B4A   |
    LDA $02             ; $049B4C   |
    SEC                 ; $049B4E   |
    SBC $06             ; $049B4F   |
    STA $0A             ; $049B51   |
    LDA $04             ; $049B53   |
    BEQ CODE_049B91     ; $049B55   |
    BMI CODE_049B62     ; $049B57   |
    TAY                 ; $049B59   |
    LDA $9AF2,y         ; $049B5A   |
    AND #$00FF          ; $049B5D   |
    BRA CODE_049B71     ; $049B60   |

CODE_049B62:
    EOR #$FFFF          ; $049B62   |
    INC A               ; $049B65   |
    TAY                 ; $049B66   |
    LDA $9AF2,y         ; $049B67   |
    AND #$00FF          ; $049B6A   |
    EOR #$FFFF          ; $049B6D   |
    INC A               ; $049B70   |

CODE_049B71:
    STA $04             ; $049B71   |
    LDA $06             ; $049B73   |

CODE_049B75:
    BMI CODE_049B80     ; $049B75   |
    TAY                 ; $049B77   |
    LDA $9AF2,y         ; $049B78   |
    AND #$00FF          ; $049B7B   |
    BRA CODE_049B9B     ; $049B7E   |

CODE_049B80:
    EOR #$FFFF          ; $049B80   |
    INC A               ; $049B83   |
    TAY                 ; $049B84   |
    LDA $9AF2,y         ; $049B85   |
    AND #$00FF          ; $049B88   |
    EOR #$FFFF          ; $049B8B   |
    INC A               ; $049B8E   |
    BRA CODE_049B9B     ; $049B8F   |

CODE_049B91:
    LDA $06             ; $049B91   |
    BNE CODE_049B75     ; $049B93   |
    ORA $04             ; $049B95   |
    BNE CODE_049B9D     ; $049B97   |
    PLB                 ; $049B99   |
    RTL                 ; $049B9A   |

CODE_049B9B:
    STA $06             ; $049B9B   |

CODE_049B9D:
    LDA #$0001          ; $049B9D   |
    PLB                 ; $049BA0   |
    RTL                 ; $049BA1   |

DATA_049BA2:         dw $FFC0, $0040

DATA_049BA6:         dw $FF80, $0080

.init_potted_spiked_guy
    LDA $7900,x         ; $049BAA   |
    CMP $7902,x         ; $049BAD   |
    BNE CODE_049BCA     ; $049BB0   |
    CMP #$FFFF          ; $049BB2   |
    BNE CODE_049BCA     ; $049BB5   |

CODE_049BB7:
    LDY $7400,x         ; $049BB7   |
    LDA $9BA6,y         ; $049BBA   |
    STA $7220,x         ; $049BBD   |
    LDA #$0040          ; $049BC0   |
    STA $7542,x         ; $049BC3   |
    INC $76,x           ; $049BC6   |
    BRA CODE_049BFB     ; $049BC8   |

CODE_049BCA:
    LDA $70E2,x         ; $049BCA   |
    AND #$0010          ; $049BCD   |
    BNE CODE_049BB7     ; $049BD0   |
    LDA #$00A1          ; $049BD2   |
    JSL $03A364         ; $049BD5   |
    BCC CODE_049BB7     ; $049BD9   |
    LDA $70E2,x         ; $049BDB   |
    STA $70E2,y         ; $049BDE   |
    LDA $7182,x         ; $049BE1   |
    STA $7182,y         ; $049BE4   |
    SEC                 ; $049BE7   |
    SBC #$000A          ; $049BE8   |
    STA $7182,x         ; $049BEB   |
    LDA #$0000          ; $049BEE   |
    STA $7900,y         ; $049BF1   |
    STA $7902,y         ; $049BF4   |
    TXA                 ; $049BF7   |
    STA $7A38,y         ; $049BF8   |

CODE_049BFB:
    STZ $7900,x         ; $049BFB   |
    STZ $7902,x         ; $049BFE   |
    RTL                 ; $049C01   |

DATA_049C02:         dw $0947, $0007

DATA_049C06:         dw $8000
DATA_049C08:         dw $9C40

.main_potted_spiked_guy
    LDY #$00            ; $049C0A   |
    LDA $7D38,x         ; $049C0C   |
    ORA $7D96,x         ; $049C0F   |
    BEQ CODE_049C1F     ; $049C12   |
    LDA #$FFFF          ; $049C14   |
    STA $7900,x         ; $049C17   |
    STA $7902,x         ; $049C1A   |
    INY                 ; $049C1D   |
    INY                 ; $049C1E   |

CODE_049C1F:
    LDA $9C02,y         ; $049C1F   |
    STA $6FA2,x         ; $049C22   |
    JSL $03AF23         ; $049C25   |
    TXY                 ; $049C29   |
    LDA $76,x           ; $049C2A   |
    ASL A               ; $049C2C   |
    TAX                 ; $049C2D   |
    JSR ($9C06,x)       ; $049C2E   |

    LDY $7D36,x         ; $049C31   |
    DEY                 ; $049C34   |
    BPL CODE_049C3C     ; $049C35   |
    JSL $03A5B7         ; $049C37   |
    RTL                 ; $049C3B   |

CODE_049C3C:
    JMP CODE_040DC1     ; $049C3C   |

    TYX                 ; $049C40   |
    LDY $7D36,x         ; $049C41   |
    DEY                 ; $049C44   |
    BMI CODE_049C87     ; $049C45   |
    LDA $7360,y         ; $049C47   |
    CMP #$00A1          ; $049C4A   |
    BNE CODE_049C87     ; $049C4D   |
    LDA $7A38,y         ; $049C4F   |
    BNE CODE_049C87     ; $049C52   |
    LDA $7D38,y         ; $049C54   |
    BNE CODE_049C87     ; $049C57   |
    LDA $70E2,x         ; $049C59   |
    SEC                 ; $049C5C   |
    SBC $70E2,y         ; $049C5D   |
    STA $7900,y         ; $049C60   |
    LDA $7182,x         ; $049C63   |
    SEC                 ; $049C66   |
    SBC $7182,y         ; $049C67   |
    CLC                 ; $049C6A   |
    ADC #$000A          ; $049C6B   |
    STA $7902,y         ; $049C6E   |
    LDA #$0000          ; $049C71   |
    STA $7D38,y         ; $049C74   |
    TXA                 ; $049C77   |
    STA $7A38,y         ; $049C78   |
    STZ $7220,x         ; $049C7B   |
    STZ $7222,x         ; $049C7E   |
    STZ $7542,x         ; $049C81   |
    STZ $76,x           ; $049C84   |
    RTS                 ; $049C86   |

CODE_049C87:
    TXA                 ; $049C87   |
    STA $3002           ; $049C88   |
    LDX #$09            ; $049C8B   |
    LDA #$8E44          ; $049C8D   |
    JSL $7EDE44         ; $049C90   | GSU init
    LDX $12             ; $049C94   |
    LDY $3002           ; $049C96   |
    BMI CODE_049CB2     ; $049C99   |
    STZ $7400,x         ; $049C9B   |
    LDA $70E2,y         ; $049C9E   |
    CMP $70E2,x         ; $049CA1   |
    BMI CODE_049CAC     ; $049CA4   |
    LDA #$0002          ; $049CA6   |
    STA $7400,x         ; $049CA9   |

CODE_049CAC:
    LDA #$0087          ; $049CAC   |
    STA $6FA2,x         ; $049CAF   |

CODE_049CB2:
    LDY $7400,x         ; $049CB2   |
    LDA $9BA6,y         ; $049CB5   |
    STA $7220,x         ; $049CB8   |
    LDA $7220,x         ; $049CBB   |
    BPL CODE_049CC4     ; $049CBE   |
    EOR #$FFFF          ; $049CC0   |
    INC A               ; $049CC3   |

CODE_049CC4:
    CLC                 ; $049CC4   |
    ADC $7A36,x         ; $049CC5   |
    CMP #$0200          ; $049CC8   |
    BMI CODE_049CDC     ; $049CCB   |
    PHA                 ; $049CCD   |
    LDA $7402,x         ; $049CCE   |
    EOR #$0001          ; $049CD1   |
    STA $7402,x         ; $049CD4   |
    PLA                 ; $049CD7   |
    SEC                 ; $049CD8   |
    SBC #$0200          ; $049CD9   |

CODE_049CDC:
    STA $7A36,x         ; $049CDC   |
    RTS                 ; $049CDF   |

.init_pot_of_potted_spiked_guy
    RTL                 ; $049CE0   |

DATA_049CE1:         dw $FA00, $FB80

.main_pot_of_potted_spiked_guy
    STZ $7400,x         ; $049CE5   |
    LDA $6F00,x         ; $049CE8   |
    CMP #$0008          ; $049CEB   |
    BNE CODE_049CFC     ; $049CEE   |
    LDY $7A38,x         ; $049CF0   |
    BEQ CODE_049CFC     ; $049CF3   |
    STZ $7A38,x         ; $049CF5   |
    JSR CODE_049DFC     ; $049CF8   |
    RTL                 ; $049CFB   |

CODE_049CFC:
    JSL $03AF23         ; $049CFC   |
    JSL $03A2C7         ; $049D00   |
    BCC CODE_049D12     ; $049D04   |
    LDY $7A38,x         ; $049D06   |
    BEQ CODE_049D0E     ; $049D09   |
    JSR CODE_049DFC     ; $049D0B   |

CODE_049D0E:
    JMP CODE_0403A3     ; $049D0E   |

CODE_049D12:
    LDY $7A38,x         ; $049D12   |
    BNE CODE_049D26     ; $049D15   |
    LDA $7860,x         ; $049D17   |
    AND #$0001          ; $049D1A   |
    BEQ CODE_049D25     ; $049D1D   |
    STZ $7402,x         ; $049D1F   |
    STZ $7220,x         ; $049D22   |

CODE_049D25:
    RTL                 ; $049D25   |

CODE_049D26:
    LDA $6F00,y         ; $049D26   |
    CMP #$0010          ; $049D29   |
    BNE CODE_049D36     ; $049D2C   |
    LDA $7360,y         ; $049D2E   |
    CMP #$0031          ; $049D31   |
    BEQ CODE_049D3A     ; $049D34   |

CODE_049D36:
    STZ $7A38,x         ; $049D36   |
    RTL                 ; $049D39   |

CODE_049D3A:
    LDA $7D96,y         ; $049D3A   |
    BEQ CODE_049D49     ; $049D3D   |
    STZ $7A38,x         ; $049D3F   |
    LDA #$0001          ; $049D42   |
    STA $79D6,y         ; $049D45   |
    RTL                 ; $049D48   |

CODE_049D49:
    LDA $7900,x         ; $049D49   |
    ORA $7902,x         ; $049D4C   |
    STA $02             ; $049D4F   |
    LDA #$000C          ; $049D51   |
    STA $00             ; $049D54   |
    LDA #$0001          ; $049D56   |
    STA $7402,x         ; $049D59   |
    LDA $7222,x         ; $049D5C   |
    BMI CODE_049DB1     ; $049D5F   |
    LDA #$000A          ; $049D61   |
    STA $00             ; $049D64   |
    STZ $7402,x         ; $049D66   |
    LDA $7860,x         ; $049D69   |
    AND #$0001          ; $049D6C   |
    BEQ CODE_049DB1     ; $049D6F   |
    LDA $7AF8,x         ; $049D71   |
    BEQ CODE_049D7B     ; $049D74   |
    DEC A               ; $049D76   |
    BEQ CODE_049D86     ; $049D77   |
    BRA CODE_049DB1     ; $049D79   |

CODE_049D7B:
    STZ $7220,x         ; $049D7B   |
    LDA #$0010          ; $049D7E   |
    STA $7AF8,x         ; $049D81   |
    BRA CODE_049DB1     ; $049D84   |

CODE_049D86:
    PHY                 ; $049D86   |
    LDY $02             ; $049D87   |
    BNE CODE_049DB0     ; $049D89   |
    LDY $77C2,x         ; $049D8B   |
    LDA $9BA2,y         ; $049D8E   |
    STA $7220,x         ; $049D91   |
    LDY #$00            ; $049D94   |
    LDA $10             ; $049D96   |
    AND #$0003          ; $049D98   |
    BEQ CODE_049DA8     ; $049D9B   |
    INC $76,x           ; $049D9D   |
    LDA $76,x           ; $049D9F   |
    CMP #$0003          ; $049DA1   |
    BEQ CODE_049DA8     ; $049DA4   |
    INY                 ; $049DA6   |
    INY                 ; $049DA7   |

CODE_049DA8:
    STZ $76,x           ; $049DA8   |
    LDA $9CE1,y         ; $049DAA   |
    STA $7222,x         ; $049DAD   |

CODE_049DB0:
    PLY                 ; $049DB0   |

CODE_049DB1:
    LDA $70E2,x         ; $049DB1   |
    CLC                 ; $049DB4   |
    ADC $7900,x         ; $049DB5   |
    STA $70E2,y         ; $049DB8   |
    LDA $7182,x         ; $049DBB   |
    SEC                 ; $049DBE   |
    SBC $00             ; $049DBF   |
    CLC                 ; $049DC1   |
    ADC $7902,x         ; $049DC2   |
    STA $7182,y         ; $049DC5   |
    LDA $7402,x         ; $049DC8   |
    STA $7402,y         ; $049DCB   |
    PHY                 ; $049DCE   |
    LDY #$00            ; $049DCF   |
    LDA $7220,x         ; $049DD1   |
    BMI CODE_049DD8     ; $049DD4   |
    INY                 ; $049DD6   |
    INY                 ; $049DD7   |

CODE_049DD8:
    TYA                 ; $049DD8   |
    PLY                 ; $049DD9   |
    STA $7400,y         ; $049DDA   |
    LDA $7900,x         ; $049DDD   |
    BEQ CODE_049DEC     ; $049DE0   |
    BPL CODE_049DE9     ; $049DE2   |
    INC $7900,x         ; $049DE4   |
    BRA CODE_049DEC     ; $049DE7   |

CODE_049DE9:
    DEC $7900,x         ; $049DE9   |

CODE_049DEC:
    LDA $7902,x         ; $049DEC   |
    BEQ CODE_049DFB     ; $049DEF   |
    BPL CODE_049DF8     ; $049DF1   |
    INC $7902,x         ; $049DF3   |
    BRA CODE_049DFB     ; $049DF6   |

CODE_049DF8:
    DEC $7902,x         ; $049DF8   |

CODE_049DFB:
    RTL                 ; $049DFB   |

CODE_049DFC:
    LDA #$0001          ; $049DFC   |
    STA $79D6,y         ; $049DFF   |
    LDA #$0040          ; $049E02   |
    STA $7542,y         ; $049E05   |
    LDA $7400,y         ; $049E08   |
    PHY                 ; $049E0B   |
    TAY                 ; $049E0C   |
    LDA $9BA6,y         ; $049E0D   |
    PLY                 ; $049E10   |
    STA $7220,y         ; $049E11   |
    RTS                 ; $049E14   |

.init_grim_leecher
    LDA #$0008          ; $049E15   |
    STA $7900,x         ; $049E18   |
    LDA #$0100          ; $049E1B   |
    STA $7A38,x         ; $049E1E   |
    RTL                 ; $049E21   |

DATA_049E22:         dw $9E7E
DATA_049E24:         dw $9EAF
DATA_049E26:         dw $9F6E
DATA_049E28:         dw $9F9B
DATA_049E2A:         dw $9FCA
DATA_049E2C:         dw $9FF9
DATA_049E2E:         dw $A03C

.main_grim_leecher
    JSL $03AF23         ; $049E30   |
    TXY                 ; $049E34   |
    LDA $76,x           ; $049E35   |
    ASL A               ; $049E37   |
    TAX                 ; $049E38   |
    JSR ($9E22,x)       ; $049E39   |

    LDA $76,x           ; $049E3C   |
    CMP #$0002          ; $049E3E   |
    BEQ CODE_049E4C     ; $049E41   |
    LDA $77C2,x         ; $049E43   |
    AND #$00FF          ; $049E46   |
    STA $7400,x         ; $049E49   |

CODE_049E4C:
    LDA $7860,x         ; $049E4C   |
    BIT #$0002          ; $049E4F   |
    BEQ CODE_049E61     ; $049E52   |
    LDA $7182,x         ; $049E54   |
    SEC                 ; $049E57   |
    SBC $72C2,x         ; $049E58   |
    STA $7182,x         ; $049E5B   |
    STZ $7222,x         ; $049E5E   |

CODE_049E61:
    LDA $16,x           ; $049E61   |
    CMP #$0006          ; $049E63   |
    BNE CODE_049E78     ; $049E66   |
    STZ $16,x           ; $049E68   |
    INC $7402,x         ; $049E6A   |
    LDA $7402,x         ; $049E6D   |
    CMP #$0003          ; $049E70   |
    BNE CODE_049E78     ; $049E73   |
    STZ $7402,x         ; $049E75   |

CODE_049E78:
    INC $16,x           ; $049E78   |
    JMP CODE_040DC1     ; $049E7A   |

    TYX                 ; $049E7E   |
    STZ $75E0,x         ; $049E7F   |
    STZ $7540,x         ; $049E82   |
    LDA $7C16,x         ; $049E85   |
    CLC                 ; $049E88   |
    ADC #$0040          ; $049E89   |
    CMP #$0080          ; $049E8C   |
    BCS CODE_049EAE     ; $049E8F   |
    LDA #$0004          ; $049E91   |
    STA $7540,x         ; $049E94   |
    LDA $10             ; $049E97   |
    AND #$003F          ; $049E99   |
    CLC                 ; $049E9C   |
    ADC #$0060          ; $049E9D   |
    LDY $7C17,x         ; $049EA0   |
    BMI CODE_049EA9     ; $049EA3   |
    EOR #$FFFF          ; $049EA5   |
    INC A               ; $049EA8   |

CODE_049EA9:
    STA $75E0,x         ; $049EA9   |
    INC $76,x           ; $049EAC   |

CODE_049EAE:
    RTS                 ; $049EAE   |

    TYX                 ; $049EAF   |
    JSR CODE_04A085     ; $049EB0   |
    LDA $10             ; $049EB3   |
    AND #$003F          ; $049EB5   |
    LDY $7C19,x         ; $049EB8   |
    BMI CODE_049EC1     ; $049EBB   |
    EOR #$FFFF          ; $049EBD   |
    INC A               ; $049EC0   |

CODE_049EC1:
    CLC                 ; $049EC1   |
    ADC $7A38,x         ; $049EC2   |
    STA $7222,x         ; $049EC5   |
    LDA $11             ; $049EC8   |
    AND #$001F          ; $049ECA   |
    CLC                 ; $049ECD   |
    ADC #$0060          ; $049ECE   |
    LDY $7C16,x         ; $049ED1   |
    BMI CODE_049EDA     ; $049ED4   |
    EOR #$FFFF          ; $049ED6   |
    INC A               ; $049ED9   |

CODE_049EDA:
    STA $75E0,x         ; $049EDA   |
    LDA $7C16,x         ; $049EDD   |
    CLC                 ; $049EE0   |
    ADC #$0060          ; $049EE1   |
    CMP #$00C0          ; $049EE4   |
    BCC CODE_049EF4     ; $049EE7   |
    STZ $75E0,x         ; $049EE9   |
    LDA #$0040          ; $049EEC   |
    STA $75E2,x         ; $049EEF   |
    STZ $76,x           ; $049EF2   |

CODE_049EF4:
    LDY $7D36,x         ; $049EF4   |
    BPL CODE_049F6D     ; $049EF7   |
    LDA $7E48           ; $049EF9   |
    AND #$00FF          ; $049EFC   |
    ORA $0CD0           ; $049EFF   |
    ORA $61D6           ; $049F02   |
    BNE CODE_049F6D     ; $049F05   |
    LDA $61B2           ; $049F07   |
    BPL CODE_049F25     ; $049F0A   |
    AND #$0FFF          ; $049F0C   |
    STA $61B2           ; $049F0F   |
    STZ $18             ; $049F12   |
    LDA #$0006          ; $049F14   |
    STA $16             ; $049F17   |
    LDA #$0010          ; $049F19   |
    STA $6F00           ; $049F1C   |
    LDA #$0040          ; $049F1F   |
    STA $7AF8           ; $049F22   |

CODE_049F25:
    LDA #$000A          ; $049F25   |
    STA $6F00,x         ; $049F28   |
    TXA                 ; $049F2B   |
    STA $7E48           ; $049F2C   |
    LDA #$2881          ; $049F2F   |
    STA $6FA2,x         ; $049F32   |
    LDA #$0904          ; $049F35   |
    STA $7040,x         ; $049F38   |
    LDA #$0020          ; $049F3B   |
    STA $0CC8           ; $049F3E   |
    STZ $7540,x         ; $049F41   |
    STZ $75E0,x         ; $049F44   |
    LDA #$0260          ; $049F47   |
    STA $7AF6,x         ; $049F4A   |
    LDA #$003E          ; $049F4D   |
    STA $7A96,x         ; $049F50   |
    LDA #$0008          ; $049F53   |
    STA $7A98,x         ; $049F56   |
    LDA #$0010          ; $049F59   |
    STA $7AF8,x         ; $049F5C   |
    LDA #$FFFF          ; $049F5F   |
    STA $0CD0           ; $049F62   |
    LDA #$8000          ; $049F65   |
    STA $0390           ; $049F68   |
    STZ $76,x           ; $049F6B   |

CODE_049F6D:
    RTS                 ; $049F6D   |

    TYX                 ; $049F6E   |
    JSR CODE_04A085     ; $049F6F   |
    LDA $7A38,x         ; $049F72   |
    BPL CODE_049F7B     ; $049F75   |
    EOR #$FFFF          ; $049F77   |
    INC A               ; $049F7A   |

CODE_049F7B:
    LSR A               ; $049F7B   |
    STA $7222,x         ; $049F7C   |
    LDA $7220,x         ; $049F7F   |
    CLC                 ; $049F82   |
    ADC #$0040          ; $049F83   |
    CMP #$0080          ; $049F86   |
    BCC CODE_049F95     ; $049F89   |
    LDA $75E0,x         ; $049F8B   |
    EOR #$FFFF          ; $049F8E   |
    INC A               ; $049F91   |
    STA $75E0,x         ; $049F92   |

CODE_049F95:
    LDA $7A96,x         ; $049F95   |
    BNE CODE_049FA1     ; $049F98   |
    RTS                 ; $049F9A   |

    TYX                 ; $049F9B   |
    LDA $7A96,x         ; $049F9C   |
    BEQ CODE_049FBA     ; $049F9F   |

CODE_049FA1:
    LDA $7A98,x         ; $049FA1   |
    BNE CODE_049FB9     ; $049FA4   |
    LDA #$0008          ; $049FA6   |
    STA $7A98,x         ; $049FA9   |
    LDA $6116           ; $049FAC   |
    EOR #$0002          ; $049FAF   |
    STA $6116           ; $049FB2   |
    JSL $04FB41         ; $049FB5   |

CODE_049FB9:
    RTS                 ; $049FB9   |

CODE_049FBA:
    LDY $6F00,x         ; $049FBA   |
    CPY #$10            ; $049FBD   |
    BEQ CODE_049FC7     ; $049FBF   |
    LDA #$FFFF          ; $049FC1   |
    STA $61EC           ; $049FC4   |

CODE_049FC7:
    INC $76,x           ; $049FC7   |
    RTS                 ; $049FC9   |

    TYX                 ; $049FCA   |
    LDA $7AF6,x         ; $049FCB   |
    BNE CODE_049FE8     ; $049FCE   |
    LDA $10             ; $049FD0   |
    AND #$003F          ; $049FD2   |
    CLC                 ; $049FD5   |
    ADC #$0060          ; $049FD6   |
    LDY $7C16,x         ; $049FD9   |
    BMI CODE_049FE2     ; $049FDC   |
    EOR #$FFFF          ; $049FDE   |
    INC A               ; $049FE1   |

CODE_049FE2:
    STA $75E0,x         ; $049FE2   |
    STZ $76,x           ; $049FE5   |
    RTS                 ; $049FE7   |

CODE_049FE8:
    JSR CODE_04A085     ; $049FE8   |
    LDA $7A38,x         ; $049FEB   |
    BMI CODE_049FF4     ; $049FEE   |
    EOR #$FFFF          ; $049FF0   |
    INC A               ; $049FF3   |

CODE_049FF4:
    ASL A               ; $049FF4   |
    STA $7222,x         ; $049FF5   |
    RTS                 ; $049FF8   |

    TYX                 ; $049FF9   |
    LDA #$0004          ; $049FFA   |
    STA $7540,x         ; $049FFD   |
    LDA #$0080          ; $04A000   |
    STA $75E0,x         ; $04A003   |
    TXA                 ; $04A006   |
    AND #$000F          ; $04A007   |
    LSR A               ; $04A00A   |
    LSR A               ; $04A00B   |
    LSR A               ; $04A00C   |
    BEQ CODE_04A015     ; $04A00D   |
    LDA #$FF80          ; $04A00F   |
    STA $75E0,x         ; $04A012   |

CODE_04A015:
    LDA #$0040          ; $04A015   |
    STA $75E2,x         ; $04A018   |
    LDA #$0008          ; $04A01B   |
    STA $7900,x         ; $04A01E   |
    LDA $10             ; $04A021   |
    AND #$003F          ; $04A023   |
    CLC                 ; $04A026   |
    ADC #$0060          ; $04A027   |
    STA $7A38,x         ; $04A02A   |
    LDA #$0004          ; $04A02D   |
    STA $7542,x         ; $04A030   |
    LDA #$0080          ; $04A033   |
    STA $7A96,x         ; $04A036   |
    INC $76,x           ; $04A039   |
    RTS                 ; $04A03B   |

    TYX                 ; $04A03C   |
    JSR CODE_04A085     ; $04A03D   |
    LDA $7A38,x         ; $04A040   |
    BPL CODE_04A049     ; $04A043   |
    EOR #$FFFF          ; $04A045   |
    INC A               ; $04A048   |

CODE_04A049:
    STA $02             ; $04A049   |
    EOR #$FFFF          ; $04A04B   |
    INC A               ; $04A04E   |
    STA $7222,x         ; $04A04F   |
    TXA                 ; $04A052   |
    AND #$000F          ; $04A053   |
    LSR A               ; $04A056   |
    LSR A               ; $04A057   |
    LSR A               ; $04A058   |
    BCS CODE_04A066     ; $04A059   |
    LDA $02             ; $04A05B   |
    LSR A               ; $04A05D   |
    LSR A               ; $04A05E   |
    EOR #$FFFF          ; $04A05F   |
    INC A               ; $04A062   |
    STA $7222,x         ; $04A063   |

CODE_04A066:
    LDA $7A96,x         ; $04A066   |
    BNE CODE_04A084     ; $04A069   |
    LDA $10             ; $04A06B   |
    AND #$003F          ; $04A06D   |
    CLC                 ; $04A070   |
    ADC #$0060          ; $04A071   |
    LDA $7C16,x         ; $04A074   |
    BMI CODE_04A07D     ; $04A077   |
    EOR #$FFFF          ; $04A079   |
    INC A               ; $04A07C   |

CODE_04A07D:
    STA $75E0,x         ; $04A07D   |
    LDY #$01            ; $04A080   |
    STY $76,x           ; $04A082   |

CODE_04A084:
    RTS                 ; $04A084   |

CODE_04A085:
    LDA $7A38,x         ; $04A085   |
    PHA                 ; $04A088   |
    CLC                 ; $04A089   |
    ADC #$0100          ; $04A08A   |
    CMP #$0200          ; $04A08D   |
    BCC CODE_04A09C     ; $04A090   |
    LDA $7900,x         ; $04A092   |
    EOR #$FFFF          ; $04A095   |
    INC A               ; $04A098   |
    STA $7900,x         ; $04A099   |

CODE_04A09C:
    PLA                 ; $04A09C   |
    CLC                 ; $04A09D   |
    ADC $7900,x         ; $04A09E   |
    STA $7A38,x         ; $04A0A1   |
    RTS                 ; $04A0A4   |

DATA_04A0A5:         dw $9F9B
DATA_04A0A7:         dw $A0B8
DATA_04A0A9:         dw $A128

    TXY                 ; $04A0AB   |
    LDA $76,x           ; $04A0AC   |
    ASL A               ; $04A0AE   |
    TAX                 ; $04A0AF   |
    JSR ($A0A5,x)       ; $04A0B0   |
    RTL                 ; $04A0B3   |

DATA_04A0B4:         dw $0040, $FFC0

    TYX                 ; $04A0B8   |
    LDY $61B3           ; $04A0B9   |
    BMI CODE_04A0C3     ; $04A0BC   |
    LDA $7AF6,x         ; $04A0BE   |
    BNE CODE_04A0D1     ; $04A0C1   |

CODE_04A0C3:
    LDY $77C2,x         ; $04A0C3   |
    LDA $A0B4,y         ; $04A0C6   |
    STA $75E0,x         ; $04A0C9   |
    LDA #$0079          ; $04A0CC   |
    BRA CODE_04A106     ; $04A0CF   |

CODE_04A0D1:
    LDA $60FC           ; $04A0D1   |
    BIT #$0018          ; $04A0D4   |
    BEQ CODE_04A0ED     ; $04A0D7   |
    CPX $0D96           ; $04A0D9   |
    BNE CODE_04A0ED     ; $04A0DC   |
    LDA #$0030          ; $04A0DE   |
    STA $7A96,x         ; $04A0E1   |
    LDA #$0004          ; $04A0E4   |
    STA $7A98,x         ; $04A0E7   |
    INC $76,x           ; $04A0EA   |

CODE_04A0EC:
    RTS                 ; $04A0EC   |

CODE_04A0ED:
    LDA $61D6           ; $04A0ED   |
    BEQ CODE_04A0EC     ; $04A0F0   |
    CPX $0D96           ; $04A0F2   |
    BEQ CODE_04A0EC     ; $04A0F5   |
    LDA $6FA0,x         ; $04A0F7   |
    EOR #$0E40          ; $04A0FA   |
    STA $6FA0,x         ; $04A0FD   |
    STZ $6FA2,x         ; $04A100   |
    LDA #$FFFF          ; $04A103   |

CODE_04A106:
    STA $7AF6,x         ; $04A106   |
    LDA #$0004          ; $04A109   |
    STA $7540,x         ; $04A10C   |
    LDA #$003E          ; $04A10F   |
    STA $7A96,x         ; $04A112   |
    STA $0CD0           ; $04A115   |
    STA $61EC           ; $04A118   |
    LDA #$0008          ; $04A11B   |
    STA $7A98,x         ; $04A11E   |
    LDA #$0003          ; $04A121   |
    STA $76,x           ; $04A124   |
    BRA CODE_04A17C     ; $04A126   |

    TYX                 ; $04A128   |
    LDA $7A98,x         ; $04A129   |
    BNE CODE_04A196     ; $04A12C   |
    LDA #$0004          ; $04A12E   |
    STA $7A98,x         ; $04A131   |
    LDA $7042,x         ; $04A134   |
    EOR #$000E          ; $04A137   |
    STA $7042,x         ; $04A13A   |
    LDA $7A96,x         ; $04A13D   |
    BNE CODE_04A196     ; $04A140   |
    LDA $6FA0,x         ; $04A142   |
    EOR #$0E40          ; $04A145   |
    STA $6FA0,x         ; $04A148   |
    STZ $6FA2,x         ; $04A14B   |
    LDA $7042,x         ; $04A14E   |
    ORA #$0080          ; $04A151   |
    STA $7042,x         ; $04A154   |
    LDA #$0080          ; $04A157   |
    STA $75E0,x         ; $04A15A   |
    LDA #$0008          ; $04A15D   |
    STA $7900,x         ; $04A160   |
    LDA #$0002          ; $04A163   |
    STA $7540,x         ; $04A166   |
    LDA #$0038          ; $04A169   |
    STA $7A96,x         ; $04A16C   |
    INC A               ; $04A16F   |
    STA $0CD0           ; $04A170   |
    STA $61EC           ; $04A173   |
    LDA #$0004          ; $04A176   |
    STA $7A98,x         ; $04A179   |

CODE_04A17C:
    STZ $16,x           ; $04A17C   |
    LDA #$0010          ; $04A17E   |
    STA $6F00,x         ; $04A181   |
    LDA #$FFFF          ; $04A184   |
    STA $7E48           ; $04A187   |
    LDA #$0881          ; $04A18A   |
    STA $6FA2,x         ; $04A18D   |
    LDA #$0954          ; $04A190   |
    STA $7040,x         ; $04A193   |

CODE_04A196:
    RTS                 ; $04A196   |

.init_board_bg3
    JSL $02813E         ; $04A197   |
    LDA $70E2,x         ; $04A19B   |
    SEC                 ; $04A19E   |
    SBC #$0008          ; $04A19F   |
    STA $70E2,x         ; $04A1A2   |
    LDA #$0140          ; $04A1A5   |
    STA $7A36,x         ; $04A1A8   |
    RTL                 ; $04A1AB   |

DATA_04A1AC:         dw $FFFC, $0004

DATA_04A1B0:         dw $FEC0, $0140

.main_board_bg3
    LDA $61B0           ; $04A1B4   |
    ORA $0B55           ; $04A1B7   |
    ORA $0398           ; $04A1BA   |
    BEQ CODE_04A1C2     ; $04A1BD   |
    JMP CODE_04A250     ; $04A1BF   |

CODE_04A1C2:
    JSR CODE_04A300     ; $04A1C2   |
    BCC CODE_04A1CB     ; $04A1C5   |
    STZ $0CB2           ; $04A1C7   |
    RTL                 ; $04A1CA   |

CODE_04A1CB:
    LDA $78,x           ; $04A1CB   |
    CMP #$2000          ; $04A1CD   |
    BPL CODE_04A1EB     ; $04A1D0   |
    LDY #$20            ; $04A1D2   |
    LDA #$0030          ; $04A1D4   |
    JSR CODE_04A280     ; $04A1D7   |
    BCS CODE_04A1EB     ; $04A1DA   |
    LDA #$0008          ; $04A1DC   |
    STA $7A38,x         ; $04A1DF   |
    CLC                 ; $04A1E2   |
    ADC $7A36,x         ; $04A1E3   |
    STA $7A36,x         ; $04A1E6   |
    BRA CODE_04A248     ; $04A1E9   |

CODE_04A1EB:
    LDY $7A38,x         ; $04A1EB   |
    BEQ CODE_04A21B     ; $04A1EE   |
    LDA $78,x           ; $04A1F0   |
    BMI CODE_04A205     ; $04A1F2   |
    LDA $7A36,x         ; $04A1F4   |
    CMP #$0140          ; $04A1F7   |
    BMI CODE_04A205     ; $04A1FA   |
    SEC                 ; $04A1FC   |
    SBC #$0010          ; $04A1FD   |
    STA $7A36,x         ; $04A200   |
    BPL CODE_04A248     ; $04A203   |

CODE_04A205:
    STZ $7A38,x         ; $04A205   |
    LDA #$0040          ; $04A208   |\ play sound #$0040
    JSL $0085D2         ; $04A20B   |/
    LDY #$00            ; $04A20F   |
    LDA $78,x           ; $04A211   |
    BPL CODE_04A217     ; $04A213   |
    INY                 ; $04A215   |
    INY                 ; $04A216   |

CODE_04A217:
    STY $16,x           ; $04A217   |
    BRA CODE_04A248     ; $04A219   |

CODE_04A21B:
    LDY $16,x           ; $04A21B   |
    LDA $7A36,x         ; $04A21D   |
    CLC                 ; $04A220   |
    ADC $A1AC,y         ; $04A221   |
    STA $7A36,x         ; $04A224   |
    SEC                 ; $04A227   |
    SBC $A1B0,y         ; $04A228   |
    EOR $A1B0,y         ; $04A22B   |
    BMI CODE_04A248     ; $04A22E   |
    LDA $A1B0,y         ; $04A230   |
    STA $7A36,x         ; $04A233   |
    EOR $78,x           ; $04A236   |
    BMI CODE_04A248     ; $04A238   |
    LDA #$0040          ; $04A23A   |\ play sound #$0040
    JSL $0085D2         ; $04A23D   |/
    LDA $16,x           ; $04A241   |
    EOR #$0002          ; $04A243   |
    STA $16,x           ; $04A246   |

CODE_04A248:
    LDA $78,x           ; $04A248   |
    CLC                 ; $04A24A   |
    ADC $7A36,x         ; $04A24B   |
    STA $78,x           ; $04A24E   |

CODE_04A250:
    LDA #$0104          ; $04A250   |
    STA $0CB8           ; $04A253   |
    LDY $79,x           ; $04A256   |
    TYA                 ; $04A258   |
    STA $00             ; $04A259   |
    LDA #$00C0          ; $04A25B   |
    SEC                 ; $04A25E   |
    SBC $00             ; $04A25F   |
    STA $7E40           ; $04A261   |
    LDA $7682,x         ; $04A264   |
    PHA                 ; $04A267   |
    SEC                 ; $04A268   |
    SBC #$0008          ; $04A269   |
    STA $7682,x         ; $04A26C   |
    LDY #$02            ; $04A26F   |
    JSL $02841C         ; $04A271   |
    PLA                 ; $04A275   |
    STA $7682,x         ; $04A276   |
    LDA #$0710          ; $04A279   |
    STA $0967           ; $04A27C   |
    RTL                 ; $04A27F   |

CODE_04A280:
    STA $04             ; $04A280   |
    ASL A               ; $04A282   |
    STA $06             ; $04A283   |
    TYA                 ; $04A285   |
    STA $300C           ; $04A286   |
    LDY $79D9,x         ; $04A289   |
    TYA                 ; $04A28C   |
    ASL A               ; $04A28D   |
    STA $3002           ; $04A28E   |
    LDX #$0B            ; $04A291   |
    LDA #$8595          ; $04A293   |
    JSL $7EDE44         ; $04A296   | GSU init
    LDX $12             ; $04A29A   |
    LDA $3002           ; $04A29C   |
    EOR #$FFFF          ; $04A29F   |
    SEC                 ; $04A2A2   |
    ADC $7CD8,x         ; $04A2A3   |
    SEC                 ; $04A2A6   |
    SBC #$0008          ; $04A2A7   |
    STA $02             ; $04A2AA   |
    SEC                 ; $04A2AC   |
    SBC $611E           ; $04A2AD   |
    SEC                 ; $04A2B0   |
    SBC $6112           ; $04A2B1   |
    SEC                 ; $04A2B4   |
    SBC $6122           ; $04A2B5   |
    DEC A               ; $04A2B8   |
    CMP #$FFF4          ; $04A2B9   |
    BCC CODE_04A2E4     ; $04A2BC   |
    STA $00             ; $04A2BE   |
    LDA $60AA           ; $04A2C0   |
    BMI CODE_04A2E4     ; $04A2C3   |
    LDA $7C16,x         ; $04A2C5   |
    CLC                 ; $04A2C8   |
    ADC $04             ; $04A2C9   |
    CMP $06             ; $04A2CB   |
    BCS CODE_04A2E4     ; $04A2CD   |
    LDA $00             ; $04A2CF   |
    CLC                 ; $04A2D1   |
    ADC $6090           ; $04A2D2   |
    CLC                 ; $04A2D5   |
    ADC #$0003          ; $04A2D6   |
    STA $6090           ; $04A2D9   |
    INC $61B4           ; $04A2DC   |
    STZ $60AA           ; $04A2DF   |
    CLC                 ; $04A2E2   |
    RTS                 ; $04A2E3   |

CODE_04A2E4:
    SEC                 ; $04A2E4   |
    RTS                 ; $04A2E5   |

CODE_04A2E6:
    LDA $7680,x         ; $04A2E6   |
    CLC                 ; $04A2E9   |
    ADC #$0068          ; $04A2EA   |
    CMP #$01D0          ; $04A2ED   |
    BCS CODE_04A318     ; $04A2F0   |
    LDA $7682,x         ; $04A2F2   |
    CLC                 ; $04A2F5   |
    ADC #$00A0          ; $04A2F6   |
    CMP #$0220          ; $04A2F9   |
    BCC CODE_04A31E     ; $04A2FC   |
    BRA CODE_04A318     ; $04A2FE   |

CODE_04A300:
    LDA $7680,x         ; $04A300   |
    CLC                 ; $04A303   |
    ADC #$0068          ; $04A304   |
    CMP #$01D0          ; $04A307   |
    BCS CODE_04A318     ; $04A30A   |
    LDA $7682,x         ; $04A30C   |
    CLC                 ; $04A30F   |
    ADC #$0080          ; $04A310   |
    CMP #$01E0          ; $04A313   |
    BCC CODE_04A31E     ; $04A316   |

CODE_04A318:
    PHP                 ; $04A318   |
    JSL $03A31E         ; $04A319   |
    PLP                 ; $04A31D   |

CODE_04A31E:
    RTS                 ; $04A31E   |

.init_large_log_bg3
    LDA $0073           ; $04A31F   |
    STA $00             ; $04A322   |
    JSL $02813E         ; $04A324   |
    LDA $00             ; $04A328   |
    STA $0073           ; $04A32A   |
    LDA $70E2,x         ; $04A32D   |
    SEC                 ; $04A330   |
    SBC #$0008          ; $04A331   |
    STA $70E2,x         ; $04A334   |
    LDA $0967           ; $04A337   |
    STA $7900,x         ; $04A33A   |
    RTL                 ; $04A33D   |

DATA_04A33E:         dw $FFA0, $0060

.main_large_log_bg3
    LDA #$0104          ; $04A342   |
    STA $0CB8           ; $04A345   |
    LDA $79,x           ; $04A348   |
    AND #$00FF          ; $04A34A   |
    STA $00             ; $04A34D   |
    LDA #$0010          ; $04A34F   |
    SEC                 ; $04A352   |
    SBC $00             ; $04A353   |
    STA $7E40           ; $04A355   |
    LDY #$04            ; $04A358   |
    JSL $02841C         ; $04A35A   |
    LDA #$0710          ; $04A35E   |
    STA $0967           ; $04A361   |
    LDA $60AC           ; $04A364   |
    CMP #$0006          ; $04A367   |
    BNE CODE_04A372     ; $04A36A   |
    LDA #$0215          ; $04A36C   |
    STA $0967           ; $04A36F   |

CODE_04A372:
    JSL $03AF23         ; $04A372   |
    JSR CODE_04A2E6     ; $04A376   |
    BCC CODE_04A3A0     ; $04A379   |
    LDX #$08            ; $04A37B   |
    LDA #$D46A          ; $04A37D   |
    JSL $7EDE44         ; $04A380   | GSU init
    REP #$10            ; $04A384   |
    JSL $00BE39         ; $04A386   |

; DMA args
DATA_04A38A:         dl $7E5040, $703372
DATA_04A390:         dw $01A4

    SEP #$10            ; $04A392   |
    LDX $12             ; $04A394   |
    STZ $0CB2           ; $04A396   |
    LDA $7900,x         ; $04A399   |
    STA $0967           ; $04A39C   |
    RTL                 ; $04A39F   |

CODE_04A3A0:
    LDA $19,x           ; $04A3A0   |
    AND #$00FF          ; $04A3A2   |
    CMP #$0020          ; $04A3A5   |
    BCC CODE_04A3AD     ; $04A3A8   |
    JMP CODE_04A45D     ; $04A3AA   |

CODE_04A3AD:
    LDY $60C0           ; $04A3AD   |
    BEQ CODE_04A3BA     ; $04A3B0   |
    LDY $60AB           ; $04A3B2   |
    BPL CODE_04A3BA     ; $04A3B5   |
    JMP CODE_04A45D     ; $04A3B7   |

CODE_04A3BA:
    LDA $7182,x         ; $04A3BA   |
    SEC                 ; $04A3BD   |
    SBC $6090           ; $04A3BE   |
    SEC                 ; $04A3C1   |
    SBC $6112           ; $04A3C2   |
    BMI CODE_04A3CC     ; $04A3C5   |
    CMP #$0038          ; $04A3C7   |
    BCC CODE_04A3CF     ; $04A3CA   |

CODE_04A3CC:
    JMP CODE_04A45D     ; $04A3CC   |

CODE_04A3CF:
    LDA $7C16,x         ; $04A3CF   |
    CLC                 ; $04A3D2   |
    ADC #$0030          ; $04A3D3   |
    CMP #$0060          ; $04A3D6   |
    BCS CODE_04A3CC     ; $04A3D9   |
    LDA $7A38,x         ; $04A3DB   |
    BNE CODE_04A406     ; $04A3DE   |
    LDA #$0038          ; $04A3E0   |
    SEC                 ; $04A3E3   |
    SBC $7182,x         ; $04A3E4   |
    CLC                 ; $04A3E7   |
    ADC $6090           ; $04A3E8   |
    STA $02             ; $04A3EB   |
    SEP #$20            ; $04A3ED   |
    LDA #$92            ; $04A3EF   |
    STA $211B           ; $04A3F1   |
    LDA #$00            ; $04A3F4   |
    STA $211B           ; $04A3F6   |
    LDA $02             ; $04A3F9   |
    STA $211C           ; $04A3FB   |
    REP #$20            ; $04A3FE   |
    LDA $2135           ; $04A400   |
    XBA                 ; $04A403   |
    STA $18,x           ; $04A404   |

CODE_04A406:
    SEP #$20            ; $04A406   |
    LDA #$C0            ; $04A408   |
    STA $211B           ; $04A40A   |
    LDA #$01            ; $04A40D   |
    STA $211B           ; $04A40F   |
    LDA $19,x           ; $04A412   |
    STA $211C           ; $04A414   |
    REP #$20            ; $04A417   |
    LDA $2135           ; $04A419   |
    CLC                 ; $04A41C   |
    ADC $7182,x         ; $04A41D   |
    SEC                 ; $04A420   |
    SBC #$0037          ; $04A421   |
    SEC                 ; $04A424   |
    SBC $6112           ; $04A425   |
    STA $6090           ; $04A428   |
    INC $61B4           ; $04A42B   |
    LDY $7A38,x         ; $04A42E   |
    BNE CODE_04A43B     ; $04A431   |
    LDA $7A36,x         ; $04A433   |
    BPL CODE_04A43B     ; $04A436   |
    STZ $7A36,x         ; $04A438   |

CODE_04A43B:
    LDA #$0001          ; $04A43B   |
    STA $7A38,x         ; $04A43E   |
    STZ $60AA           ; $04A441   |
    LDA $7A36,x         ; $04A444   |
    CLC                 ; $04A447   |
    ADC #$0008          ; $04A448   |
    CMP #$0400          ; $04A44B   |
    BCS CODE_04A453     ; $04A44E   |
    STA $7A36,x         ; $04A450   |

CODE_04A453:
    LDA $18,x           ; $04A453   |
    CLC                 ; $04A455   |
    ADC $7A36,x         ; $04A456   |
    STA $18,x           ; $04A459   |
    BRA CODE_04A4A8     ; $04A45B   |

CODE_04A45D:
    LDA $7A38,x         ; $04A45D   |
    BEQ CODE_04A478     ; $04A460   |
    STZ $7A38,x         ; $04A462   |
    LDA $19,x           ; $04A465   |
    AND #$00FF          ; $04A467   |
    CMP #$0020          ; $04A46A   |
    BCC CODE_04A478     ; $04A46D   |
    LDA #$0400          ; $04A46F   |
    STA $60AA           ; $04A472   |
    STZ $7902,x         ; $04A475   |

CODE_04A478:
    STZ $18,x           ; $04A478   |
    LDA $7902,x         ; $04A47A   |
    TAY                 ; $04A47D   |
    DEC A               ; $04A47E   |
    STA $00             ; $04A47F   |
    LDA #$0002          ; $04A481   |
    CPY #$00            ; $04A484   |
    BNE CODE_04A48C     ; $04A486   |
    EOR #$FFFF          ; $04A488   |
    INC A               ; $04A48B   |

CODE_04A48C:
    CLC                 ; $04A48C   |
    ADC $7A36,x         ; $04A48D   |
    STA $7A36,x         ; $04A490   |
    SEC                 ; $04A493   |
    SBC $A33E,y         ; $04A494   |
    EOR $00             ; $04A497   |
    BMI CODE_04A4A8     ; $04A499   |
    TYA                 ; $04A49B   |
    EOR #$0002          ; $04A49C   |
    STA $7902,x         ; $04A49F   |
    LDA $A33E,y         ; $04A4A2   |
    STA $7A36,x         ; $04A4A5   |

CODE_04A4A8:
    LDA $78,x           ; $04A4A8   |
    CLC                 ; $04A4AA   |
    ADC $7A36,x         ; $04A4AB   |
    STA $78,x           ; $04A4AE   |
    RTL                 ; $04A4B0   |

.init_plank_bg3 							 ; both sprite IDs
    INC $0DF9           ; $04A4B1   |
    RTL                 ; $04A4B4   |

DATA_04A4B5:         dw $A4B7, $0804, $30E8, $E8F8
DATA_04A4BD:         dw $F830, $3018, $1808, $0430
DATA_04A4C5:         dw $0060, $A201, $0201, $02E0
DATA_04A4CD:         dw $2203, $0003

DATA_04A4D1:         dw $A5FB
DATA_04A4D3:         dw $A65C

.main_plank_bg3                              ; both sprite IDs
    LDA $0030           ; $04A4D5   |
    CMP $0DF7           ; $04A4D8   |
    BEQ CODE_04A4F1     ; $04A4DB   |
    STA $0DF7           ; $04A4DD   |
    LDA $0DF9           ; $04A4E0   |
    STA $0DFB           ; $04A4E3   |
    LDX #$08            ; $04A4E6   |
    LDA #$D46A          ; $04A4E8   |
    JSL $7EDE44         ; $04A4EB   | GSU init
    LDX $12             ; $04A4EF   |

CODE_04A4F1:
    LDA $61B0           ; $04A4F1   |
    ORA $0B55           ; $04A4F4   |
    ORA $0398           ; $04A4F7   |
    BEQ CODE_04A4FF     ; $04A4FA   |
    JMP CODE_04A586     ; $04A4FC   |

CODE_04A4FF:
    LDX $12             ; $04A4FF   |
    JSR CODE_04A300     ; $04A501   |
    BCC CODE_04A579     ; $04A504   |
    DEC $0DF9           ; $04A506   |
    DEC $0DFB           ; $04A509   |
    BNE CODE_04A578     ; $04A50C   |
    REP #$10            ; $04A50E   |
    JSL $00BE39         ; $04A510   |

; DMA args
DATA_04A514:         dl $7E5040, $703372
DATA_04A51A:         dw $0348

    SEP #$30            ; $04A51C   |
    LDA #$10            ; $04A51E   |
    STA $0967           ; $04A520   |
    LDA #$07            ; $04A523   |
    STA $0968           ; $04A525   |
    LDA #$02            ; $04A528   |
    STA $096B           ; $04A52A   |
    LDA #$20            ; $04A52D   |
    STA $096C           ; $04A52F   |
    LDA #$18            ; $04A532   |
    STA $094A           ; $04A534   |
    REP #$20            ; $04A537   |
    LDA #$14E9          ; $04A539   |
    STA $702002         ; $04A53C   |
    STA $702D6E         ; $04A540   |
    LDA #$14E9          ; $04A544   |
    STA $702010         ; $04A547   |
    STA $702D7C         ; $04A54B   |
    LDA #$3216          ; $04A54F   |
    STA $702004         ; $04A552   |
    STA $702D70         ; $04A556   |
    LDA #$3216          ; $04A55A   |
    STA $702012         ; $04A55D   |
    STA $702D7E         ; $04A561   |
    LDA #$0000          ; $04A565   |
    STA $702006         ; $04A568   |
    STA $702D72         ; $04A56C   |
    STA $702014         ; $04A570   |
    STA $702D80         ; $04A574   |

CODE_04A578:
    RTL                 ; $04A578   |

CODE_04A579:
    TXY                 ; $04A579   |
    LDA $7360,x         ; $04A57A   |
    SEC                 ; $04A57D   |
    SBC #$005E          ; $04A57E   |
    ASL A               ; $04A581   |
    TAX                 ; $04A582   |
    JSR ($A4D1,x)       ; $04A583   |

CODE_04A586:
    LDA #$0104          ; $04A586   |
    STA $0CB8           ; $04A589   |
    LDA $79,x           ; $04A58C   |
    AND #$00FF          ; $04A58E   |
    STA $00             ; $04A591   |
    LDA #$00C0          ; $04A593   |
    SEC                 ; $04A596   |
    SBC $00             ; $04A597   |
    STA $7E40           ; $04A599   |
    LDA $7682,x         ; $04A59C   |
    PHA                 ; $04A59F   |
    SEC                 ; $04A5A0   |
    SBC #$0010          ; $04A5A1   |
    STA $7682,x         ; $04A5A4   |
    LDY #$B900          ; $04A5A7   |
    LDA $A4,x           ; $04A5AA   |
    STA $301A           ; $04A5AC   |
    LDA #$0078          ; $04A5AF   |
    SEC                 ; $04A5B2   |
    SBC $7680,x         ; $04A5B3   |
    STA $0041           ; $04A5B6   |
    STA $3002           ; $04A5B9   |
    LDA $7682,x         ; $04A5BC   |
    CLC                 ; $04A5BF   |
    ADC #$000F          ; $04A5C0   |
    STA $3004           ; $04A5C3   |
    CLC                 ; $04A5C6   |
    ADC $003B           ; $04A5C7   |
    STA $0CB6           ; $04A5CA   |
    LDA $0CB8           ; $04A5CD   |
    STA $3006           ; $04A5D0   |
    LDA $7E40           ; $04A5D3   |
    AND #$00FF          ; $04A5D6   |
    STA $3008           ; $04A5D9   |
    LDA #$0004          ; $04A5DC   |
    STA $3018           ; $04A5DF   |
    LDX #$08            ; $04A5E2   |
    LDA #$D486          ; $04A5E4   |
    JSL $7EDE44         ; $04A5E7   |
    DEC $0DFB           ; $04A5EB   |
    BNE CODE_04A5F4     ; $04A5EE   |
    JSL $04A50E         ; $04A5F0   |

CODE_04A5F4:
    LDX $12             ; $04A5F4   |
    PLA                 ; $04A5F6   |
    STA $7682,x         ; $04A5F7   |
    RTL                 ; $04A5FA   |

    TYX                 ; $04A5FB   |
    LDA $7A38,x         ; $04A5FC   |
    BEQ CODE_04A612     ; $04A5FF   |

CODE_04A601:
    LDA $78,x           ; $04A601   |
    CLC                 ; $04A603   |
    ADC $7A36,x         ; $04A604   |
    BPL CODE_04A60F     ; $04A607   |
    STZ $7A38,x         ; $04A609   |
    LDA #$0000          ; $04A60C   |

CODE_04A60F:
    STA $78,x           ; $04A60F   |
    RTS                 ; $04A611   |

CODE_04A612:
    LDA $79,x           ; $04A612   |
    AND #$00FF          ; $04A614   |
    CMP #$0020          ; $04A617   |
    BCC CODE_04A621     ; $04A61A   |
    INC $7A38,x         ; $04A61C   |
    BRA CODE_04A601     ; $04A61F   |

CODE_04A621:
    LDY #$20            ; $04A621   |
    LDA #$0018          ; $04A623   |
    JSR CODE_04A280     ; $04A626   |
    BCS CODE_04A64B     ; $04A629   |
    LDA $78,x           ; $04A62B   |
    CLC                 ; $04A62D   |
    ADC $7A36,x         ; $04A62E   |
    CMP #$4000          ; $04A631   |
    BCC CODE_04A639     ; $04A634   |
    LDA #$4000          ; $04A636   |

CODE_04A639:
    STA $78,x           ; $04A639   |
    LDA $7A36,x         ; $04A63B   |
    CLC                 ; $04A63E   |
    ADC #$0003          ; $04A63F   |
    CMP #$0200          ; $04A642   |
    BCS CODE_04A65B     ; $04A645   |
    STA $7A36,x         ; $04A647   |
    RTS                 ; $04A64A   |

CODE_04A64B:
    STZ $7A36,x         ; $04A64B   |
    LDA $78,x           ; $04A64E   |
    SEC                 ; $04A650   |
    SBC #$0100          ; $04A651   |
    BPL CODE_04A659     ; $04A654   |
    LDA #$0000          ; $04A656   |

CODE_04A659:
    STA $78,x           ; $04A659   |

CODE_04A65B:
    RTS                 ; $04A65B   |

    TYX                 ; $04A65C   |
    LDA $7A96,x         ; $04A65D   |
    BNE CODE_04A69E     ; $04A660   |
    INC $7A38,x         ; $04A662   |
    LDA $7A36,x         ; $04A665   |
    CLC                 ; $04A668   |
    ADC #$0010          ; $04A669   |
    CLC                 ; $04A66C   |
    ADC $7A38,x         ; $04A66D   |
    CMP #$0400          ; $04A670   |
    BCS CODE_04A678     ; $04A673   |
    STA $7A36,x         ; $04A675   |

CODE_04A678:
    LDA $78,x           ; $04A678   |
    CLC                 ; $04A67A   |
    ADC $7A36,x         ; $04A67B   |
    BPL CODE_04A69C     ; $04A67E   |
    STZ $7A38,x         ; $04A680   |
    STZ $7A36,x         ; $04A683   |
    LDA $70E2,x         ; $04A686   |
    AND #$0010          ; $04A689   |
    BNE CODE_04A693     ; $04A68C   |
    LDA #$0060          ; $04A68E   |
    BRA CODE_04A696     ; $04A691   |

CODE_04A693:
    LDA #$0080          ; $04A693   |

CODE_04A696:
    STA $7A96,x         ; $04A696   |
    LDA #$0000          ; $04A699   |

CODE_04A69C:
    STA $78,x           ; $04A69C   |

CODE_04A69E:
    LDA $78,x           ; $04A69E   |
    CMP #$1500          ; $04A6A0   |
    BCS CODE_04A6AD     ; $04A6A3   |
    LDY #$20            ; $04A6A5   |
    LDA #$0018          ; $04A6A7   |
    JSR CODE_04A280     ; $04A6AA   |

CODE_04A6AD:
    RTS                 ; $04A6AD   |

.init_red_platform
    LDA $7182,x         ; $04A6AE   |
    AND #$0010          ; $04A6B1   |
    BEQ CODE_04A6BB     ; $04A6B4   |
    LDA #$FF90          ; $04A6B6   |
    BRA CODE_04A6BE     ; $04A6B9   |

CODE_04A6BB:
    LDA #$0070          ; $04A6BB   |

CODE_04A6BE:
    STA $75E0,x         ; $04A6BE   |
    LDA #$0005          ; $04A6C1   |
    STA $7540,x         ; $04A6C4   |
    LDA $70E2,x         ; $04A6C7   |
    CLC                 ; $04A6CA   |
    ADC #$0028          ; $04A6CB   |
    STA $7900,x         ; $04A6CE   |
    SEC                 ; $04A6D1   |
    SBC #$0050          ; $04A6D2   |
    STA $7902,x         ; $04A6D5   |

CODE_04A6D8:
    LDA $0136           ; $04A6D8   |
    CMP #$0003          ; $04A6DB   |
    BEQ CODE_04A6E5     ; $04A6DE   |
    CMP #$000D          ; $04A6E0   |
    BNE CODE_04A6EB     ; $04A6E3   |

CODE_04A6E5:
    INC $7B58,x         ; $04A6E5   |
    INC $7B58,x         ; $04A6E8   |

CODE_04A6EB:
    LDA #$0014          ; $04A6EB   |
    STA $7BB6,x         ; $04A6EE   |
    LDA #$0008          ; $04A6F1   |
    STA $7BB8,x         ; $04A6F4   |
    RTL                 ; $04A6F7   |

.main_red_platform
    JSL $03AF23         ; $04A6F8   |
    LDA $70E2,x         ; $04A6FC   |
    CMP $7902,x         ; $04A6FF   |
    BMI CODE_04A709     ; $04A702   |
    CMP $7900,x         ; $04A704   |
    BMI CODE_04A722     ; $04A707   |

CODE_04A709:
    LDA $18,x           ; $04A709   |
    STA $70E2,x         ; $04A70B   |
    CLC                 ; $04A70E   |
    ADC #$0008          ; $04A70F   |
    STA $7CD6,x         ; $04A712   |
    STZ $7220,x         ; $04A715   |
    LDA $75E0,x         ; $04A718   |
    EOR #$FFFF          ; $04A71B   |
    INC A               ; $04A71E   |
    STA $75E0,x         ; $04A71F   |

CODE_04A722:
    JMP CODE_04A77C     ; $04A722   |

.init_pink_platform
    LDA $70E2,x         ; $04A725   |
    AND #$0010          ; $04A728   |
    BEQ CODE_04A732     ; $04A72B   |
    LDA #$FF90          ; $04A72D   |
    BRA CODE_04A735     ; $04A730   |

CODE_04A732:
    LDA #$0070          ; $04A732   |

CODE_04A735:
    STA $75E2,x         ; $04A735   |
    LDA #$0005          ; $04A738   |
    STA $7542,x         ; $04A73B   |
    LDA $7182,x         ; $04A73E   |
    CLC                 ; $04A741   |
    ADC #$0020          ; $04A742   |
    STA $7900,x         ; $04A745   |
    SEC                 ; $04A748   |
    SBC #$0040          ; $04A749   |
    STA $7902,x         ; $04A74C   |
    JMP CODE_04A6D8     ; $04A74F   |

.main_pink_platform
    JSL $03AF23         ; $04A752   |
    LDA $7182,x         ; $04A756   |
    CMP $7902,x         ; $04A759   |
    BMI CODE_04A763     ; $04A75C   |
    CMP $7900,x         ; $04A75E   |
    BMI CODE_04A77C     ; $04A761   |

CODE_04A763:
    LDA $78,x           ; $04A763   |
    STA $7182,x         ; $04A765   |
    CLC                 ; $04A768   |
    ADC #$0008          ; $04A769   |
    STA $7CD8,x         ; $04A76C   |
    STZ $7222,x         ; $04A76F   |
    LDA $75E2,x         ; $04A772   |
    EOR #$FFFF          ; $04A775   |
    INC A               ; $04A778   |
    STA $75E2,x         ; $04A779   |

CODE_04A77C:
    LDA $70E2,x         ; $04A77C   |
    SEC                 ; $04A77F   |
    SBC $18,x           ; $04A780   |
    STA $72C0,x         ; $04A782   |
    LDA $7182,x         ; $04A785   |
    SEC                 ; $04A788   |
    SBC $78,x           ; $04A789   |
    STA $72C2,x         ; $04A78B   |
    LDY $0B59           ; $04A78E   |
    BNE CODE_04A7F3     ; $04A791   |
    LDY $60AB           ; $04A793   |
    BMI CODE_04A7F3     ; $04A796   |
    LDY $0D94           ; $04A798   |
    BNE CODE_04A7F3     ; $04A79B   |
    CPX $61B6           ; $04A79D   |
    BNE CODE_04A7EE     ; $04A7A0   |
    LDA $60FC           ; $04A7A2   |
    AND #$01E0          ; $04A7A5   |
    BEQ CODE_04A7B3     ; $04A7A8   |
    AND #$0180          ; $04A7AA   |
    DEC A               ; $04A7AD   |
    EOR $7220,x         ; $04A7AE   |
    BMI CODE_04A7C7     ; $04A7B1   |

CODE_04A7B3:
    LDA $608C           ; $04A7B3   |
    CLC                 ; $04A7B6   |
    ADC $72C0,x         ; $04A7B7   |
    STA $608C           ; $04A7BA   |
    LDA $611C           ; $04A7BD   |
    CLC                 ; $04A7C0   |
    ADC $72C0,x         ; $04A7C1   |
    STA $611C           ; $04A7C4   |

CODE_04A7C7:
    LDA $60FC           ; $04A7C7   |
    AND #$001F          ; $04A7CA   |
    BEQ CODE_04A7D8     ; $04A7CD   |
    AND #$0018          ; $04A7CF   |
    DEC A               ; $04A7D2   |
    EOR $7222,x         ; $04A7D3   |
    BMI CODE_04A7EE     ; $04A7D6   |

CODE_04A7D8:
    LDA $6090           ; $04A7D8   |
    CLC                 ; $04A7DB   |
    ADC $72C2,x         ; $04A7DC   |
    STA $6090           ; $04A7DF   |
    LDA $611E           ; $04A7E2   |
    CLC                 ; $04A7E5   |
    ADC $72C2,x         ; $04A7E6   |
    STA $611E           ; $04A7E9   |
    BRA CODE_04A7F6     ; $04A7EC   |

CODE_04A7EE:
    LDY $60C0           ; $04A7EE   |
    BNE CODE_04A7F6     ; $04A7F1   |

CODE_04A7F3:
    JMP CODE_04A853     ; $04A7F3   |

CODE_04A7F6:
    LDA $7BB6,x         ; $04A7F6   |
    CLC                 ; $04A7F9   |
    ADC $6120           ; $04A7FA   |
    ASL A               ; $04A7FD   |
    STA $00             ; $04A7FE   |
    LSR A               ; $04A800   |
    CLC                 ; $04A801   |
    ADC $7CD6,x         ; $04A802   |
    SEC                 ; $04A805   |
    SBC $611C           ; $04A806   |
    CMP $00             ; $04A809   |
    BCS CODE_04A853     ; $04A80B   |
    LDA $7BB8,x         ; $04A80D   |
    CLC                 ; $04A810   |
    ADC $6122           ; $04A811   |
    ASL A               ; $04A814   |
    STA $00             ; $04A815   |
    LSR A               ; $04A817   |
    CLC                 ; $04A818   |
    ADC $7CD8,x         ; $04A819   |
    SEC                 ; $04A81C   |
    SBC $611E           ; $04A81D   |
    CMP $00             ; $04A820   |
    BCS CODE_04A853     ; $04A822   |
    SEC                 ; $04A824   |
    SBC $00             ; $04A825   |
    STA $02             ; $04A827   |
    CMP #$FFF6          ; $04A829   |
    BCC CODE_04A853     ; $04A82C   |
    CPX $61B6           ; $04A82E   |
    BEQ CODE_04A83B     ; $04A831   |
    LDY $61B6           ; $04A833   |
    BNE CODE_04A85B     ; $04A836   |
    STX $61B6           ; $04A838   |

CODE_04A83B:
    LDA $6090           ; $04A83B   |
    CLC                 ; $04A83E   |
    ADC $02             ; $04A83F   |
    CLC                 ; $04A841   |
    ADC #$0002          ; $04A842   |
    STA $6090           ; $04A845   |
    STZ $60D2           ; $04A848   |
    STZ $60AA           ; $04A84B   |
    INC $61B4           ; $04A84E   |
    BRA CODE_04A85B     ; $04A851   |

CODE_04A853:
    CPX $61B6           ; $04A853   |
    BNE CODE_04A85B     ; $04A856   |
    STZ $61B6           ; $04A858   |

CODE_04A85B:
    LDA $70E2,x         ; $04A85B   |
    STA $18,x           ; $04A85E   |
    LDA $7182,x         ; $04A860   |
    STA $78,x           ; $04A863   |
    RTL                 ; $04A865   |

DATA_04A866:         dw $AA00, $0000
DATA_04A86A:         dw $5400, $0001
DATA_04A86E:         dw $0000, $0004

; following code is these sprites:
; 185 Active line guided green Flatbed Ferry, left
; 186 Active line guided green Flatbed Ferry, right
; 187 Active line guided yellow Flatbed Ferry, left
; 188 Active line guided yellow Flatbed Ferry, right
; 189 Line guided green Flatbed Ferry, left
; 18A Line guided green Flatbed Ferry, right
; 18B Line guided yellow Flatbed Ferry, left
; 18C Line guided yellow Flatbed Ferry, right
; 18D Line guided red Flatbed Ferry, left
; 18E Line guided red Flatbed Ferry, right

.init_line_guided_platform
    LDA $7360,x         ; $04A872   |
    SEC                 ; $04A875   |
    SBC #$0185          ; $04A876   |
    AND #$0002          ; $04A879   |
    ASL A               ; $04A87C   |
    TAY                 ; $04A87D   |
    LDA $A866,y         ; $04A87E   |
    STA $7A36,x         ; $04A881   |
    LDA $A868,y         ; $04A884   |
    STA $7A38,x         ; $04A887   |
    LDA #$0080          ; $04A88A   | init inactive platform
    STA $7900,x         ; $04A88D   |
    LDA #$0185          ; $04A890   |
    AND #$0001          ; $04A893   |
    STA $00             ; $04A896   |
    LDA $7360,x         ; $04A898   |
    SEC                 ; $04A89B   |
    SBC #$0185          ; $04A89C   |
    AND #$0001          ; $04A89F   |
    CMP $00             ; $04A8A2   |
    BNE CODE_04A8AB     ; $04A8A4   |
    LDA #$8000          ; $04A8A6   |
    STA $16,x           ; $04A8A9   |

CODE_04A8AB:
    LDA #$0014          ; $04A8AB   |
    STA $7BB6,x         ; $04A8AE   |
    LDA #$0008          ; $04A8B1   |
    STA $7BB8,x         ; $04A8B4   |
    RTL                 ; $04A8B7   |

.main_line_guided_platform
    JSL $03AF23         ; $04A8B8   |
    LDA $70E2,x         ; $04A8BC   |
    STA $00             ; $04A8BF   |
    LDA $7182,x         ; $04A8C1   |
    STA $02             ; $04A8C4   |
    JSL $04A9FD         ; $04A8C6   |
    LDY $7900,x         ; $04A8CA   |
    BMI CODE_04A8FF     ; $04A8CD   |
    LDA $70E2,x         ; $04A8CF   |
    SEC                 ; $04A8D2   |
    SBC $00             ; $04A8D3   |
    CLC                 ; $04A8D5   |
    ADC $72C0,x         ; $04A8D6   |
    STA $72C0,x         ; $04A8D9   |
    LDA $7182,x         ; $04A8DC   |
    SEC                 ; $04A8DF   |
    SBC $02             ; $04A8E0   |
    CLC                 ; $04A8E2   |
    ADC $72C2,x         ; $04A8E3   |
    STA $72C2,x         ; $04A8E6   |
    LDA $70E2,x         ; $04A8E9   |
    CLC                 ; $04A8EC   |
    ADC $7B56,x         ; $04A8ED   |
    STA $7CD6,x         ; $04A8F0   |
    LDA $7182,x         ; $04A8F3   |
    CLC                 ; $04A8F6   |
    ADC $7B58,x         ; $04A8F7   |
    STA $7CD8,x         ; $04A8FA   |
    BRA CODE_04A92A     ; $04A8FD   |

CODE_04A8FF:
    LDA $7222,x         ; $04A8FF   |
    BPL CODE_04A92A     ; $04A902   |
    CMP #$8000          ; $04A904   |
    ROR A               ; $04A907   |
    STA $3004           ; $04A908   |
    LDA $7220,x         ; $04A90B   |
    CMP #$8000          ; $04A90E   |
    ROR A               ; $04A911   |
    STA $3002           ; $04A912   |
    LDX #$0B            ; $04A915   |
    LDA #$BCF8          ; $04A917   |
    JSL $7EDE44         ; $04A91A   |
    LDX $12             ; $04A91E   |
    LDA $3000           ; $04A920   |
    STA $75E0,x         ; $04A923   |
    LSR A               ; $04A926   |
    XBA                 ; $04A927   |
    STA $16,x           ; $04A928   |

CODE_04A92A:
    LDY $61B6           ; $04A92A   |
    STY $0E             ; $04A92D   |
    JSL $04A78E         ; $04A92F   |
    LDA $7A38,x         ; $04A933   |
    ORA $7A36,x         ; $04A936   |
    BNE CODE_04A959     ; $04A939   |
    CPX $61B6           ; $04A93B   |
    BNE CODE_04A958     ; $04A93E   |
    LDA $7360,x         ; $04A940   |
    SEC                 ; $04A943   |
    SBC #$0189          ; $04A944   |
    AND #$0006          ; $04A947   |
    ASL A               ; $04A94A   |
    TAY                 ; $04A94B   |
    LDA $A866,y         ; $04A94C   |
    STA $7A36,x         ; $04A94F   |
    LDA $A868,y         ; $04A952   |
    STA $7A38,x         ; $04A955   |

CODE_04A958:
    RTL                 ; $04A958   |

CODE_04A959:
    CPX $0E             ; $04A959   |
    BNE CODE_04A958     ; $04A95B   |
    CPX $61B6           ; $04A95D   |
    BEQ CODE_04A958     ; $04A960   |
    LDA $61D6           ; $04A962   |
    BNE CODE_04A958     ; $04A965   |
    LDY $0D94           ; $04A967   |
    BNE CODE_04A958     ; $04A96A   |
    LDY $7900,x         ; $04A96C   |
    BMI CODE_04A9A8     ; $04A96F   |
    LDA $16,x           ; $04A971   |
    AND #$FF00          ; $04A973   |
    XBA                 ; $04A976   |
    ASL A               ; $04A977   |
    EOR #$0100          ; $04A978   |
    STA $3002           ; $04A97B   |
    LDA $7A37,x         ; $04A97E   |
    STA $300C           ; $04A981   |
    LDX #$0B            ; $04A984   |
    LDA #$8595          ; $04A986   |
    JSL $7EDE44         ; $04A989   | GSU init
    LDX $12             ; $04A98D   |
    LDA $3000           ; $04A98F   |
    CLC                 ; $04A992   |
    ADC $60A8           ; $04A993   |
    STA $60A8           ; $04A996   |
    STA $60B4           ; $04A999   |
    LDA $3002           ; $04A99C   |
    CLC                 ; $04A99F   |
    ADC $60AA           ; $04A9A0   |
    STA $60AA           ; $04A9A3   |
    BRA CODE_04A9CD     ; $04A9A6   |

CODE_04A9A8:
    LDA $7220,x         ; $04A9A8   |
    ORA $7222,x         ; $04A9AB   |
    BEQ CODE_04A9FC     ; $04A9AE   |
    LDA $7220,x         ; $04A9B0   |
    CLC                 ; $04A9B3   |
    ADC $60A8           ; $04A9B4   |
    STA $60A8           ; $04A9B7   |
    STA $60B4           ; $04A9BA   |
    LDA $7222,x         ; $04A9BD   |
    BMI CODE_04A9C6     ; $04A9C0   |
    CMP #$8000          ; $04A9C2   |
    ROR A               ; $04A9C5   |

CODE_04A9C6:
    CLC                 ; $04A9C6   |
    ADC $60AA           ; $04A9C7   |
    STA $60AA           ; $04A9CA   |

CODE_04A9CD:
    LDA $60A8           ; $04A9CD   |
    CMP #$0800          ; $04A9D0   |
    BMI CODE_04A9D8     ; $04A9D3   |
    LDA #$0800          ; $04A9D5   |

CODE_04A9D8:
    CMP #$F800          ; $04A9D8   |
    BPL CODE_04A9E0     ; $04A9DB   |
    LDA #$F800          ; $04A9DD   |

CODE_04A9E0:
    STA $60A8           ; $04A9E0   |
    STA $60B4           ; $04A9E3   |
    LDA $60AA           ; $04A9E6   |
    CMP #$0800          ; $04A9E9   |
    BMI CODE_04A9F1     ; $04A9EC   |
    LDA #$0800          ; $04A9EE   |

CODE_04A9F1:
    CMP #$F800          ; $04A9F1   |
    BPL CODE_04A9F9     ; $04A9F4   |
    LDA #$F800          ; $04A9F6   |

CODE_04A9F9:
    STA $60AA           ; $04A9F9   |

CODE_04A9FC:
    RTL                 ; $04A9FC   |

; line guided platform sub
    LDA $16,x           ; $04A9FD   |
    STA $6046           ; $04A9FF   |
    TXA                 ; $04AA02   |
    STA $3014           ; $04AA03   |
    LDA #$FFFF          ; $04AA06   |
    STA $6040           ; $04AA09   |
    LDA $75E0,x         ; $04AA0C   |
    STA $601E           ; $04AA0F   |
    LDX #$0B            ; $04AA12   |
    LDA #$89E9          ; $04AA14   |
    JSL $7EDE44         ; $04AA17   | gsu
    LDX $12             ; $04AA1B   |
    LDA $601E           ; $04AA1D   |
    STA $75E0,x         ; $04AA20   |
    RTL                 ; $04AA23   |

.init_whirling_lift
    JSL $03AE60         ; $04AA24   |
    LDA #$0080          ; $04AA28   |
    STA $7900,x         ; $04AA2B   |
    STZ $7400,x         ; $04AA2E   |
    RTL                 ; $04AA31   |

.main_whirling_lift
    JSL $03AA52         ; $04AA32   |
    JSL $03AF23         ; $04AA36   |
    STZ $0E             ; $04AA3A   |
    LDA $70E2,x         ; $04AA3C   |
    STA $00             ; $04AA3F   |
    LDA $7182,x         ; $04AA41   |
    STA $02             ; $04AA44   |
    JSR CODE_04AAA2     ; $04AA46   |
    LDY $7900,x         ; $04AA49   |
    BMI CODE_04AA6A     ; $04AA4C   |
    LDA $70E2,x         ; $04AA4E   |
    SEC                 ; $04AA51   |
    SBC $00             ; $04AA52   |
    CLC                 ; $04AA54   |
    ADC $72C0,x         ; $04AA55   |
    STA $72C0,x         ; $04AA58   |
    LDA $7182,x         ; $04AA5B   |
    SEC                 ; $04AA5E   |
    SBC $02             ; $04AA5F   |
    CLC                 ; $04AA61   |
    ADC $72C2,x         ; $04AA62   |
    STA $72C2,x         ; $04AA65   |
    BRA CODE_04AA95     ; $04AA68   |

CODE_04AA6A:
    LDA $7222,x         ; $04AA6A   |
    BPL CODE_04AA95     ; $04AA6D   |
    CMP #$8000          ; $04AA6F   |
    ROR A               ; $04AA72   |
    STA $3004           ; $04AA73   |
    LDA $7220,x         ; $04AA76   |
    CMP #$8000          ; $04AA79   |
    ROR A               ; $04AA7C   |
    STA $3002           ; $04AA7D   |
    LDX #$0B            ; $04AA80   |
    LDA #$BCF8          ; $04AA82   |
    JSL $7EDE44         ; $04AA85   |
    LDX $12             ; $04AA89   |
    LDA $3000           ; $04AA8B   |
    STA $75E0,x         ; $04AA8E   |
    LSR A               ; $04AA91   |
    XBA                 ; $04AA92   |
    STA $16,x           ; $04AA93   |

CODE_04AA95:
    JSR CODE_04AABE     ; $04AA95   |
    JSR CODE_04ABC6     ; $04AA98   |
    JSR CODE_04ABED     ; $04AA9B   |
    JSR CODE_04AC61     ; $04AA9E   |
    RTL                 ; $04AAA1   |

; whirling lift sub

CODE_04AAA2:
    TXA                 ; $04AAA2   |
    STA $3014           ; $04AAA3   |
    LDA $75E0,x         ; $04AAA6   |
    STA $601E           ; $04AAA9   |
    LDX #$0B            ; $04AAAC   |
    LDA #$89E9          ; $04AAAE   |
    JSL $7EDE44         ; $04AAB1   |
    LDX $12             ; $04AAB5   |
    LDA $601E           ; $04AAB7   |
    STA $75E0,x         ; $04AABA   |
    RTS                 ; $04AABD   |

; whirling lift sub

CODE_04AABE:
    LDY $7D36,x         ; $04AABE   |
    BMI CODE_04AB06     ; $04AAC1   |

CODE_04AAC3:
    CPX $61B6           ; $04AAC3   |
    BNE CODE_04AB05     ; $04AAC6   |
    STZ $61B6           ; $04AAC8   |
    LDY $0D94           ; $04AACB   |
    BNE CODE_04AB05     ; $04AACE   |
    LDA $16,x           ; $04AAD0   |
    AND #$FF00          ; $04AAD2   |
    XBA                 ; $04AAD5   |
    ASL A               ; $04AAD6   |
    EOR #$0100          ; $04AAD7   |
    STA $3002           ; $04AADA   |
    LDA $7A37,x         ; $04AADD   |
    STA $300C           ; $04AAE0   |
    LDX #$0B            ; $04AAE3   |
    LDA #$8595          ; $04AAE5   |
    JSL $7EDE44         ; $04AAE8   |
    LDX $12             ; $04AAEC   |
    LDA $3000           ; $04AAEE   |
    CLC                 ; $04AAF1   |
    ADC $60A8           ; $04AAF2   |
    STA $60A8           ; $04AAF5   |
    STA $60B4           ; $04AAF8   |
    LDA $3002           ; $04AAFB   |
    CLC                 ; $04AAFE   |
    ADC $60AA           ; $04AAFF   |
    STA $60AA           ; $04AB02   |

CODE_04AB05:
    RTS                 ; $04AB05   |

CODE_04AB06:
    LDY $60AB           ; $04AB06   |
    BMI CODE_04AAC3     ; $04AB09   |
    LDY $0D94           ; $04AB0B   |
    BNE CODE_04AAC3     ; $04AB0E   |
    LDA $7C18,x         ; $04AB10   |
    SEC                 ; $04AB13   |
    SBC $6122           ; $04AB14   |
    SEC                 ; $04AB17   |
    SBC $7BB8,x         ; $04AB18   |
    CMP #$FFF8          ; $04AB1B   |
    BCC CODE_04AAC3     ; $04AB1E   |
    CPX $61B6           ; $04AB20   |
    BEQ CODE_04AB35     ; $04AB23   |
    LDY $61B6           ; $04AB25   |
    BNE CODE_04AB05     ; $04AB28   |
    STX $61B6           ; $04AB2A   |
    LDA $608B           ; $04AB2D   |
    AND #$FF00          ; $04AB30   |
    STA $76,x           ; $04AB33   |

CODE_04AB35:
    LDA $7182,x         ; $04AB35   |
    SEC                 ; $04AB38   |
    SBC #$0022          ; $04AB39   |
    STA $6090           ; $04AB3C   |
    STZ $60AA           ; $04AB3F   |
    INC $61B4           ; $04AB42   |
    LDA #$0120          ; $04AB45   |
    JSL $04AB6F         ; $04AB48   |
    LDA $16,x           ; $04AB4C   |
    CLC                 ; $04AB4E   |
    ADC #$4000          ; $04AB4F   |
    PHP                 ; $04AB52   |
    LDA $7C16,x         ; $04AB53   |
    XBA                 ; $04AB56   |
    AND #$FF00          ; $04AB57   |
    CMP #$8000          ; $04AB5A   |
    ROR A               ; $04AB5D   |
    CMP #$8000          ; $04AB5E   |
    ROR A               ; $04AB61   |
    PLP                 ; $04AB62   |
    BPL CODE_04AB69     ; $04AB63   |
    EOR #$FFFF          ; $04AB65   |
    INC A               ; $04AB68   |

CODE_04AB69:
    CLC                 ; $04AB69   |
    ADC $0E             ; $04AB6A   |
    STA $0E             ; $04AB6C   |
    RTS                 ; $04AB6E   |

; whirling lift sub
    STA $300C           ; $04AB6F   |
    LDA $72BF,x         ; $04AB72   |
    AND #$FF00          ; $04AB75   |
    STA $3000           ; $04AB78   |
    LDX #$0B            ; $04AB7B   |
    LDA #$86B6          ; $04AB7D   |
    JSL $7EDE44         ; $04AB80   |
    LDX $12             ; $04AB84   |
    LDA $608B           ; $04AB86   |
    AND #$FF00          ; $04AB89   |
    STA $00             ; $04AB8C   |
    LDY $76,x           ; $04AB8E   |
    TYA                 ; $04AB90   |
    ORA $00             ; $04AB91   |
    STA $76,x           ; $04AB93   |
    LDA $608D           ; $04AB95   |
    AND #$00FF          ; $04AB98   |
    STA $00             ; $04AB9B   |
    LDA $3000           ; $04AB9D   |
    BPL CODE_04ABAE     ; $04ABA0   |
    CLC                 ; $04ABA2   |
    ADC $76,x           ; $04ABA3   |
    STA $76,x           ; $04ABA5   |
    LDA $00             ; $04ABA7   |
    SBC #$0000          ; $04ABA9   |
    BRA CODE_04ABB8     ; $04ABAC   |

CODE_04ABAE:
    CLC                 ; $04ABAE   |
    ADC $76,x           ; $04ABAF   |
    STA $76,x           ; $04ABB1   |
    LDA $00             ; $04ABB3   |
    ADC #$0000          ; $04ABB5   |

CODE_04ABB8:
    XBA                 ; $04ABB8   |
    STA $00             ; $04ABB9   |
    LDA $77,x           ; $04ABBB   |
    AND #$00FF          ; $04ABBD   |
    ORA $00             ; $04ABC0   |
    STA $608C           ; $04ABC2   |
    RTL                 ; $04ABC5   |

; whirling lift sub

CODE_04ABC6:
    LDA $16,x           ; $04ABC6   |
    AND #$FF00          ; $04ABC8   |
    XBA                 ; $04ABCB   |
    ASL A               ; $04ABCC   |
    STA $3002           ; $04ABCD   |
    LDA #$FC00          ; $04ABD0   |
    STA $300C           ; $04ABD3   |
    LDX #$0B            ; $04ABD6   |
    LDA #$8595          ; $04ABD8   |
    JSL $7EDE44         ; $04ABDB   |
    LDX $12             ; $04ABDF   |
    LDA $3002           ; $04ABE1   |
    BPL CODE_04ABE7     ; $04ABE4   |
    ASL A               ; $04ABE6   |

CODE_04ABE7:
    CLC                 ; $04ABE7   |
    ADC $0E             ; $04ABE8   |
    STA $0E             ; $04ABEA   |
    RTS                 ; $04ABEC   |

; whirling lift sub

CODE_04ABED:
    LDA $0E             ; $04ABED   |
    SEC                 ; $04ABEF   |
    SBC #$0080          ; $04ABF0   |
    BPL CODE_04AC24     ; $04ABF3   |
    CLC                 ; $04ABF5   |
    ADC $7A36,x         ; $04ABF6   |
    STA $7A36,x         ; $04ABF9   |
    LDA $7A38,x         ; $04ABFC   |
    SBC #$0000          ; $04ABFF   |
    STA $7A38,x         ; $04AC02   |
    BPL CODE_04AC48     ; $04AC05   |
    STZ $7A38,x         ; $04AC07   |
    STZ $7A36,x         ; $04AC0A   |
    LDA $16,x           ; $04AC0D   |
    CLC                 ; $04AC0F   |
    ADC #$8000          ; $04AC10   |
    STA $16,x           ; $04AC13   |
    LDA $75E0,x         ; $04AC15   |
    CLC                 ; $04AC18   |
    ADC #$0100          ; $04AC19   |
    AND #$01FE          ; $04AC1C   |
    STA $75E0,x         ; $04AC1F   |
    BRA CODE_04AC48     ; $04AC22   |

CODE_04AC24:
    CLC                 ; $04AC24   |
    ADC $7A36,x         ; $04AC25   |
    STA $7A36,x         ; $04AC28   |
    LDA $7A38,x         ; $04AC2B   |
    ADC #$0000          ; $04AC2E   |
    STA $7A38,x         ; $04AC31   |
    LDA $7A37,x         ; $04AC34   |
    CMP #$0200          ; $04AC37   |
    BMI CODE_04AC48     ; $04AC3A   |
    LDA #$0002          ; $04AC3C   |
    STA $7A38,x         ; $04AC3F   |
    LDA #$0000          ; $04AC42   |
    STZ $7A36,x         ; $04AC45   |

CODE_04AC48:
    LDA $16,x           ; $04AC48   |
    CLC                 ; $04AC4A   |
    ADC #$4000          ; $04AC4B   |
    PHP                 ; $04AC4E   |
    LDA $7A37,x         ; $04AC4F   |
    ASL A               ; $04AC52   |
    ASL A               ; $04AC53   |
    PLP                 ; $04AC54   |
    BPL CODE_04AC5B     ; $04AC55   |
    EOR #$FFFF          ; $04AC57   |
    INC A               ; $04AC5A   |

CODE_04AC5B:
    CLC                 ; $04AC5B   |
    ADC $78,x           ; $04AC5C   |
    STA $78,x           ; $04AC5E   |
    RTS                 ; $04AC60   |

; whirling lift sub

CODE_04AC61:
    LDA #$0001          ; $04AC61   |
    STA $3018           ; $04AC64   |
    LDA #$0055          ; $04AC67   |
    STA $301A           ; $04AC6A   |
    LDA $79,x           ; $04AC6D   |
    AND #$00FF          ; $04AC6F   |
    STA $300A           ; $04AC72   |
    LDA #$0100          ; $04AC75   |
    STA $300C           ; $04AC78   |
    LDY $7722,x         ; $04AC7B   |
    TYX                 ; $04AC7E   |
    LDA $03A9CE,x       ; $04AC7F   |
    STA $3006           ; $04AC83   |
    LDA $03A9EE,x       ; $04AC86   |
    STA $3004           ; $04AC8A   |
    LDX #$08            ; $04AC8D   |
    LDA #$8205          ; $04AC8F   |
    JSL $7EDE44         ; $04AC92   |
    LDX $12             ; $04AC96   |
    INC $0CF9           ; $04AC98   |
    RTS                 ; $04AC9B   |

.kill_yoshi_A
    LDA #$000E          ; $04AC9C   |
    JSL $04F6E2         ; $04AC9F   |
    STZ $60C6           ; $04ACA3   |
    LDA #$003A          ; $04ACA6   |
    STA $60F8           ; $04ACA9   |
    LDA #$0022          ; $04ACAC   |
    STA $61D2           ; $04ACAF   |
    STZ $61F4           ; $04ACB2   |
    STZ $61AE           ; $04ACB5   |
    RTL                 ; $04ACB8   |

.init_log_seesaw
    JSL $03AE60         ; $04ACB9   |
    JSL $04AE9D         ; $04ACBD   |
    STZ $7400,x         ; $04ACC1   |
    LDA #$2000          ; $04ACC4   |
    STA $7900,x         ; $04ACC7   |
    RTL                 ; $04ACCA   |

DATA_04ACCB:         dw $0020, $FFE0
DATA_04ACCF:         dw $FF00, $0100

.main_log_seesaw
    LDY #$00            ; $04ACD3   |
    JSR CODE_04AEDF     ; $04ACD5   |
    LDY #$00            ; $04ACD8   |
    LDA $7A39,x         ; $04ACDA   |
    AND #$00FF          ; $04ACDD   |
    CLC                 ; $04ACE0   |
    ADC #$0020          ; $04ACE1   |
    AND #$00FF          ; $04ACE4   |
    CMP #$0040          ; $04ACE7   |
    BCC CODE_04AD09     ; $04ACEA   |
    CMP #$0080          ; $04ACEC   |
    BMI CODE_04ACF3     ; $04ACEF   |
    INY                 ; $04ACF1   |
    INY                 ; $04ACF2   |

CODE_04ACF3:
    LDA $ACCF,y         ; $04ACF3   |
    STA $75E0,x         ; $04ACF6   |
    LDA #$0020          ; $04ACF9   |
    STA $7540,x         ; $04ACFC   |
    ASL A               ; $04ACFF   |
    STA $7542,x         ; $04AD00   |
    LDA #$0400          ; $04AD03   |
    STA $75E2,x         ; $04AD06   |

CODE_04AD09:
    LDA $7A39,x         ; $04AD09   |
    AND #$00FF          ; $04AD0C   |
    ASL A               ; $04AD0F   |
    STA $3002           ; $04AD10   |
    LDA #$1A00          ; $04AD13   |
    STA $300C           ; $04AD16   |
    LDX #$0B            ; $04AD19   |
    LDA #$855B          ; $04AD1B   |
    JSL $7EDE44         ; $04AD1E   |
    LDX $12             ; $04AD22   |
    PHX                 ; $04AD24   |
    LDA $7722,x         ; $04AD25   |
    LSR A               ; $04AD28   |
    CLC                 ; $04AD29   |
    ADC #$01C0          ; $04AD2A   |
    STA $00             ; $04AD2D   |
    LDA $7042,x         ; $04AD2F   |
    XBA                 ; $04AD32   |
    AND #$FF00          ; $04AD33   |
    ORA $00             ; $04AD36   |
    STA $00             ; $04AD38   |
    LDA $70E2,x         ; $04AD3A   |
    CLC                 ; $04AD3D   |
    ADC #$0008          ; $04AD3E   |
    SEC                 ; $04AD41   |
    SBC $6094           ; $04AD42   |
    SEC                 ; $04AD45   |
    SBC $3000           ; $04AD46   |
    STA $02             ; $04AD49   |
    LDA $7182,x         ; $04AD4B   |
    CLC                 ; $04AD4E   |
    ADC #$0008          ; $04AD4F   |
    SEC                 ; $04AD52   |
    SBC $609C           ; $04AD53   |
    SEC                 ; $04AD56   |
    SBC $3002           ; $04AD57   |
    STA $04             ; $04AD5A   |
    LDA #$0003          ; $04AD5C   |
    STA $06             ; $04AD5F   |
    REP #$10            ; $04AD61   |
    LDY $7362,x         ; $04AD63   |

CODE_04AD66:
    LDA $02             ; $04AD66   |
    SEC                 ; $04AD68   |
    SBC #$0010          ; $04AD69   |
    STA $6000,y         ; $04AD6C   |
    STA $6010,y         ; $04AD6F   |
    LDA $02             ; $04AD72   |
    STA $6008,y         ; $04AD74   |
    STA $6018,y         ; $04AD77   |
    CLC                 ; $04AD7A   |
    ADC $3000           ; $04AD7B   |
    STA $02             ; $04AD7E   |
    LDA $04             ; $04AD80   |
    SEC                 ; $04AD82   |
    SBC #$0010          ; $04AD83   |
    STA $6002,y         ; $04AD86   |
    STA $600A,y         ; $04AD89   |
    LDA $04             ; $04AD8C   |
    STA $6012,y         ; $04AD8E   |
    STA $601A,y         ; $04AD91   |
    CLC                 ; $04AD94   |
    ADC $3002           ; $04AD95   |
    STA $04             ; $04AD98   |
    LDA $00             ; $04AD9A   |
    STA $6004,y         ; $04AD9C   |
    INC A               ; $04AD9F   |
    INC A               ; $04ADA0   |
    STA $600C,y         ; $04ADA1   |
    CLC                 ; $04ADA4   |
    ADC #$001E          ; $04ADA5   |
    STA $6014,y         ; $04ADA8   |
    INC A               ; $04ADAB   |
    INC A               ; $04ADAC   |
    STA $601C,y         ; $04ADAD   |
    TYA                 ; $04ADB0   |
    CLC                 ; $04ADB1   |
    ADC #$0020          ; $04ADB2   |
    TAY                 ; $04ADB5   |
    DEC $06             ; $04ADB6   |
    BNE CODE_04AD66     ; $04ADB8   |
    SEP #$10            ; $04ADBA   |
    PLX                 ; $04ADBC   |
    JSL $03AF23         ; $04ADBD   |
    LDA $60AA           ; $04ADC1   |
    BPL CODE_04ADC9     ; $04ADC4   |
    JMP CODE_04AE51     ; $04ADC6   |

CODE_04ADC9:
    LDA $7A39,x         ; $04ADC9   |
    AND #$00FF          ; $04ADCC   |
    CLC                 ; $04ADCF   |
    ADC #$0028          ; $04ADD0   |
    AND #$00FF          ; $04ADD3   |
    CMP #$0050          ; $04ADD6   |
    BCC CODE_04ADDE     ; $04ADD9   |
    JMP CODE_04AE56     ; $04ADDB   |

CODE_04ADDE:
    LDA #$FA00          ; $04ADDE   |
    STA $3008           ; $04ADE1   |
    LDY $18,x           ; $04ADE4   |
    BEQ CODE_04AE00     ; $04ADE6   |
    LDA $7E12           ; $04ADE8   |
    SEC                 ; $04ADEB   |
    SBC $608C           ; $04ADEC   |
    BPL CODE_04ADF5     ; $04ADEF   |
    EOR #$FFFF          ; $04ADF1   |
    INC A               ; $04ADF4   |

CODE_04ADF5:
    CLC                 ; $04ADF5   |
    ADC $6090           ; $04ADF6   |
    CLC                 ; $04ADF9   |
    ADC #$0004          ; $04ADFA   |
    STA $6090           ; $04ADFD   |

CODE_04AE00:
    LDY #$00            ; $04AE00   |
    LDA $611C           ; $04AE02   |
    SEC                 ; $04AE05   |
    SBC $7CD6,x         ; $04AE06   |
    BMI CODE_04AE0D     ; $04AE09   |
    INY                 ; $04AE0B   |
    INY                 ; $04AE0C   |

CODE_04AE0D:
    JSR CODE_04AF4D     ; $04AE0D   |
    LDA $603E           ; $04AE10   |
    BEQ CODE_04AE51     ; $04AE13   |
    LDA $7CD8,x         ; $04AE15   |
    CLC                 ; $04AE18   |
    ADC $603C           ; $04AE19   |
    SEC                 ; $04AE1C   |
    SBC $6112           ; $04AE1D   |
    SEC                 ; $04AE20   |
    SBC #$0020          ; $04AE21   |
    STA $6090           ; $04AE24   |
    LDA $60AA           ; $04AE27   |
    ASL A               ; $04AE2A   |
    ASL A               ; $04AE2B   |
    ASL A               ; $04AE2C   |
    STZ $60AA           ; $04AE2D   |
    INC $61B4           ; $04AE30   |
    LDY $18,x           ; $04AE33   |
    BNE CODE_04AE3B     ; $04AE35   |
    INC $18,x           ; $04AE37   |
    BRA CODE_04AE49     ; $04AE39   |

CODE_04AE3B:
    LDA $04             ; $04AE3B   |
    BPL CODE_04AE43     ; $04AE3D   |
    EOR #$FFFF          ; $04AE3F   |
    INC A               ; $04AE42   |

CODE_04AE43:
    ASL A               ; $04AE43   |
    ASL A               ; $04AE44   |
    CLC                 ; $04AE45   |
    ADC #$0200          ; $04AE46   |

CODE_04AE49:
    STA $00             ; $04AE49   |
    LDY $02             ; $04AE4B   |
    CPY #$01            ; $04AE4D   |
    BRA CODE_04AE62     ; $04AE4F   |

CODE_04AE51:
    LDY $7A39,x         ; $04AE51   |
    BRA CODE_04AE59     ; $04AE54   |

CODE_04AE56:
    LDY $7902,x         ; $04AE56   |

CODE_04AE59:
    STZ $18,x           ; $04AE59   |
    LDA #$0200          ; $04AE5B   |
    STA $00             ; $04AE5E   |
    CPY #$00            ; $04AE60   |

CODE_04AE62:
    BPL CODE_04AE80     ; $04AE62   |
    LDA $7900,x         ; $04AE64   |
    CLC                 ; $04AE67   |
    ADC $00             ; $04AE68   |
    STA $7900,x         ; $04AE6A   |
    LDA $7902,x         ; $04AE6D   |
    ADC #$0000          ; $04AE70   |
    STA $7902,x         ; $04AE73   |
    LDA #$0100          ; $04AE76   |
    CMP $7901,x         ; $04AE79   |
    BPL CODE_04AE9D     ; $04AE7C   |
    BRA CODE_04AE9A     ; $04AE7E   |

CODE_04AE80:
    LDA $7900,x         ; $04AE80   |
    SEC                 ; $04AE83   |
    SBC $00             ; $04AE84   |
    STA $7900,x         ; $04AE86   |
    LDA $7902,x         ; $04AE89   |
    SBC #$0000          ; $04AE8C   |
    STA $7902,x         ; $04AE8F   |
    LDA #$FF00          ; $04AE92   |
    CMP $7901,x         ; $04AE95   |
    BMI CODE_04AE9D     ; $04AE98   |

CODE_04AE9A:
    STA $7901,x         ; $04AE9A   |

CODE_04AE9D:
    LDA #$4060          ; $04AE9D   |
    LDY #$54            ; $04AEA0   |
    STA $3018           ; $04AEA2   |
    TYA                 ; $04AEA5   |
    STA $301A           ; $04AEA6   |
    LDY $7A39,x         ; $04AEA9   |
    TYA                 ; $04AEAC   |
    STA $300A           ; $04AEAD   |
    LDA #$0100          ; $04AEB0   |
    STA $300C           ; $04AEB3   |
    LDY $7722,x         ; $04AEB6   |
    TYX                 ; $04AEB9   |
    LDA $03A9CE,x       ; $04AEBA   |
    STA $3006           ; $04AEBE   |
    LDA $03A9EE,x       ; $04AEC1   |
    STA $3004           ; $04AEC5   |
    LDX #$08            ; $04AEC8   |
    LDA #$8205          ; $04AECA   |
    JSL $7EDE44         ; $04AECD   | GSU init
    LDX $12             ; $04AED1   |
    INC $0CF9           ; $04AED3   |
    RTL                 ; $04AED6   |

DATA_04AED7:         dw $C000, $4001
DATA_04AEDB:         dw $E000, $2001

; common seesaw sub

CODE_04AEDF:
    LDA $61B0           ; $04AEDF   |
    ORA $0B55           ; $04AEE2   |
    ORA $0398           ; $04AEE5   |
    BNE CODE_04AF3C     ; $04AEE8   |
    LDA $7A38,x         ; $04AEEA   |
    STA $00             ; $04AEED   |
    CLC                 ; $04AEEF   |
    ADC $7901,x         ; $04AEF0   |
    BPL CODE_04AEFF     ; $04AEF3   |
    CMP $AED7,y         ; $04AEF5   |
    BPL CODE_04AF39     ; $04AEF8   |
    LDA $AED7,y         ; $04AEFA   |
    BRA CODE_04AF07     ; $04AEFD   |

CODE_04AEFF:
    CMP $AED9,y         ; $04AEFF   |
    BMI CODE_04AF39     ; $04AF02   |
    LDA $AED9,y         ; $04AF04   |

CODE_04AF07:
    PHA                 ; $04AF07   |
    LDA $7360,x         ; $04AF08   |
    CMP #$003D          ; $04AF0B   |
    BNE CODE_04AF38     ; $04AF0E   |
    LDA $7901,x         ; $04AF10   |
    CMP #$8000          ; $04AF13   |
    ROR A               ; $04AF16   |
    CMP #$8000          ; $04AF17   |
    ROR A               ; $04AF1A   |
    EOR #$FFFF          ; $04AF1B   |
    INC A               ; $04AF1E   |
    STA $7901,x         ; $04AF1F   |
    SEP #$20            ; $04AF22   |
    LDA $7903,x         ; $04AF24   |
    CMP #$80            ; $04AF27   |
    ROR A               ; $04AF29   |
    CMP #$80            ; $04AF2A   |
    ROR A               ; $04AF2C   |
    EOR #$FF            ; $04AF2D   |
    INC A               ; $04AF2F   |
    STA $7903,x         ; $04AF30   |
    STZ $7900,x         ; $04AF33   |
    REP #$20            ; $04AF36   |

CODE_04AF38:
    PLA                 ; $04AF38   |

CODE_04AF39:
    STA $7A38,x         ; $04AF39   |

CODE_04AF3C:
    RTS                 ; $04AF3C   |

DATA_04AF3D:         dw $D900, $2700
DATA_04AF41:         dw $F000, $1000
DATA_04AF45:         dw $8C00, $7400

DATA_04AF49:         dw $0000, $8000

; common platform/seesaw sub

CODE_04AF4D:
    STA $300E           ; $04AF4D   |
    STA $04             ; $04AF50   |
    LDA $AF3D,y         ; $04AF52   |
    STA $3002           ; $04AF55   |
    TYA                 ; $04AF58   |
    AND #$0002          ; $04AF59   |
    TAY                 ; $04AF5C   |
    LDA $AF49,y         ; $04AF5D   |
    STA $3018           ; $04AF60   |
    STY $02             ; $04AF63   |
    LDA $6090           ; $04AF65   |
    CLC                 ; $04AF68   |
    ADC $6112           ; $04AF69   |
    CLC                 ; $04AF6C   |
    ADC #$0020          ; $04AF6D   |
    SEC                 ; $04AF70   |
    SBC $7CD8,x         ; $04AF71   |
    STA $3010           ; $04AF74   |
    LDA $18,x           ; $04AF77   |
    STA $301A           ; $04AF79   |
    LDY $7A39,x         ; $04AF7C   |
    TYA                 ; $04AF7F   |
    ASL A               ; $04AF80   |
    STA $3012           ; $04AF81   |
    PHX                 ; $04AF84   |
    REP #$10            ; $04AF85   |
    TAX                 ; $04AF87   |
    LDA $0BBA12,x       ; $04AF88   |
    STA $3004           ; $04AF8C   |
    SEP #$10            ; $04AF8F   |
    PLX                 ; $04AF91   |
    LDX #$0B            ; $04AF92   |
    LDA #$8500          ; $04AF94   |
    JSL $7EDE44         ; $04AF97   | GSU init
    LDX $12             ; $04AF9B   |
    RTS                 ; $04AF9D   |

.init_water_platform
    LDA $70E2,x         ; $04AF9E   |
    CLC                 ; $04AFA1   |
    ADC #$0008          ; $04AFA2   |
    STA $70E2,x         ; $04AFA5   |
    LDA $7182,x         ; $04AFA8   |
    CLC                 ; $04AFAB   |
    ADC #$0008          ; $04AFAC   |
    STA $7182,x         ; $04AFAF   |
    LDA #$0080          ; $04AFB2   |
    STA $7222,x         ; $04AFB5   |
    STZ $7400,x         ; $04AFB8   |
    RTL                 ; $04AFBB   |

DATA_04AFBC:         dw $FE00, $0200

.main_water_platform
    LDY $7722,x         ; $04AFC0   |
    BMI CODE_04AFC9     ; $04AFC3   |
    JSL $03AA52         ; $04AFC5   |

CODE_04AFC9:
    JSL $03AF23         ; $04AFC9   |
    LDY #$04            ; $04AFCD   |
    JSR CODE_04AEDF     ; $04AFCF   |
    LDY $18,x           ; $04AFD2   |
    BNE CODE_04AFEB     ; $04AFD4   |
    CLC                 ; $04AFD6   |
    ADC #$0200          ; $04AFD7   |
    CMP #$0400          ; $04AFDA   |
    BCS CODE_04AFEB     ; $04AFDD   |
    STZ $7A38,x         ; $04AFDF   |
    LDY $7722,x         ; $04AFE2   |
    BMI CODE_04AFEB     ; $04AFE5   |
    JSL $03AEFD         ; $04AFE7   |

CODE_04AFEB:
    LDY $60AB           ; $04AFEB   |
    BPL CODE_04AFF3     ; $04AFEE   |
    JMP CODE_04B09F     ; $04AFF0   |

CODE_04AFF3:
    LDA #$F800          ; $04AFF3   |
    STA $3008           ; $04AFF6   |
    LDY $18,x           ; $04AFF9   |
    BEQ CODE_04B015     ; $04AFFB   |
    LDA $7E12           ; $04AFFD   |
    SEC                 ; $04B000   |
    SBC $608C           ; $04B001   |
    BPL CODE_04B00A     ; $04B004   |
    EOR #$FFFF          ; $04B006   |
    INC A               ; $04B009   |

CODE_04B00A:
    CLC                 ; $04B00A   |
    ADC $6090           ; $04B00B   |
    CLC                 ; $04B00E   |
    ADC #$0004          ; $04B00F   |
    STA $6090           ; $04B012   |

CODE_04B015:
    LDY #$04            ; $04B015   |
    LDA $611C           ; $04B017   |
    SEC                 ; $04B01A   |
    SBC $7CD6,x         ; $04B01B   |
    BMI CODE_04B022     ; $04B01E   |
    INY                 ; $04B020   |
    INY                 ; $04B021   |

CODE_04B022:
    JSR CODE_04AF4D     ; $04B022   |
    LDA $603E           ; $04B025   |
    BEQ CODE_04B09F     ; $04B028   |
    LDA $7CD8,x         ; $04B02A   |
    CLC                 ; $04B02D   |
    ADC $603C           ; $04B02E   |
    SEC                 ; $04B031   |
    SBC #$0020          ; $04B032   |
    SEC                 ; $04B035   |
    SBC $6112           ; $04B036   |
    STA $6090           ; $04B039   |
    LDA $60AA           ; $04B03C   |
    ASL A               ; $04B03F   |
    ASL A               ; $04B040   |
    ASL A               ; $04B041   |
    PHA                 ; $04B042   |
    STZ $60AA           ; $04B043   |
    LDY $7A39,x         ; $04B046   |
    TYA                 ; $04B049   |
    ASL A               ; $04B04A   |
    STA $3002           ; $04B04B   |
    CLC                 ; $04B04E   |
    ADC #$0020          ; $04B04F   |
    AND #$01FE          ; $04B052   |
    CMP #$0040          ; $04B055   |
    BCC CODE_04B078     ; $04B058   |
    LDA #$0008          ; $04B05A   |
    STA $300C           ; $04B05D   |
    LDX #$0B            ; $04B060   |
    LDA #$8595          ; $04B062   |
    JSL $7EDE44         ; $04B065   | GSU init
    LDX $12             ; $04B069   |
    LDA $3002           ; $04B06B   |
    CLC                 ; $04B06E   |
    ADC $60A8           ; $04B06F   |
    STA $60A8           ; $04B072   |
    STA $60B4           ; $04B075   |

CODE_04B078:
    INC $61B4           ; $04B078   |
    LDY $7722,x         ; $04B07B   |
    BPL CODE_04B084     ; $04B07E   |
    JSL $03AD74         ; $04B080   |

CODE_04B084:
    LDY $18,x           ; $04B084   |
    BNE CODE_04B093     ; $04B086   |
    LDA #$FFFA          ; $04B088   |
    STA $7720,x         ; $04B08B   |
    INC $18,x           ; $04B08E   |
    PLA                 ; $04B090   |
    BRA CODE_04B097     ; $04B091   |

CODE_04B093:
    PLA                 ; $04B093   |
    LDA #$1000          ; $04B094   |

CODE_04B097:
    STA $00             ; $04B097   |
    LDY $02             ; $04B099   |
    CPY #$01            ; $04B09B   |
    BRA CODE_04B0BE     ; $04B09D   |

CODE_04B09F:
    STZ $18,x           ; $04B09F   |
    STZ $7720,x         ; $04B0A1   |
    LDY #$00            ; $04B0A4   |
    LDA $7A38,x         ; $04B0A6   |
    BNE CODE_04B0B3     ; $04B0A9   |
    STA $7900,x         ; $04B0AB   |
    STA $7902,x         ; $04B0AE   |
    BRA CODE_04B0F6     ; $04B0B1   |

CODE_04B0B3:
    BPL CODE_04B0B7     ; $04B0B3   |
    INY                 ; $04B0B5   |
    INY                 ; $04B0B6   |

CODE_04B0B7:
    LDA $AFBC,y         ; $04B0B7   |
    BRA CODE_04B0F3     ; $04B0BA   |
; unused
    CPY #$00            ; $04B0BC   |

CODE_04B0BE:
    BPL CODE_04B0DC     ; $04B0BE   |
    LDA $7900,x         ; $04B0C0   |
    CLC                 ; $04B0C3   |
    ADC $00             ; $04B0C4   |
    STA $7900,x         ; $04B0C6   |
    LDA $7902,x         ; $04B0C9   |
    ADC #$0000          ; $04B0CC   |
    STA $7902,x         ; $04B0CF   |
    LDA #$0100          ; $04B0D2   |
    CMP $7901,x         ; $04B0D5   |
    BPL CODE_04B0F6     ; $04B0D8   |
    BRA CODE_04B0F3     ; $04B0DA   |

CODE_04B0DC:
    LDA $7900,x         ; $04B0DC   |
    SEC                 ; $04B0DF   |
    SBC $00             ; $04B0E0   |
    STA $7900,x         ; $04B0E2   |
    LDA $7902,x         ; $04B0E5   |
    SBC #$0000          ; $04B0E8   |
    STA $7902,x         ; $04B0EB   |
    LDA #$FF00          ; $04B0EE   |
    BMI CODE_04B0F6     ; $04B0F1   |

CODE_04B0F3:
    STA $7901,x         ; $04B0F3   |

CODE_04B0F6:
    LDA $7722,x         ; $04B0F6   |
    BMI CODE_04B104     ; $04B0F9   |
    LDA #$2060          ; $04B0FB   |
    LDY #$55            ; $04B0FE   |
    JSL $04AEA2         ; $04B100   |

CODE_04B104:
    LDA #$0040          ; $04B104   |
    LDY $7862,x         ; $04B107   |
    BEQ CODE_04B10F     ; $04B10A   |
    LDA #$FFC0          ; $04B10C   |

CODE_04B10F:
    STA $75E2,x         ; $04B10F   |
    SEP #$20            ; $04B112   |
    LDA #$FF            ; $04B114   |
    STA $7862,x         ; $04B116   |
    REP #$20            ; $04B119   |
    RTL                 ; $04B11B   |

.init_seesaw
    LDA $0CB2           ; $04B11C   |
    BEQ CODE_04B125     ; $04B11F   |
    JMP CODE_0403A3     ; $04B121   |

CODE_04B125:
    INC $0CB2           ; $04B125   |
    LDA #$0078          ; $04B128   |
    LDY $0073           ; $04B12B   |
    BEQ CODE_04B133     ; $04B12E   |
    LDA #$FF88          ; $04B130   |

CODE_04B133:
    CLC                 ; $04B133   |
    ADC $70E2,x         ; $04B134   |
    STA $70E2,x         ; $04B137   |
    LDX #$04            ; $04B13A   |

CODE_04B13C:
    LDA $5FE33E,x       ; $04B13C   |
    STA $702002,x       ; $04B140   |
    STA $702D6E,x       ; $04B144   |
    DEX                 ; $04B148   |
    DEX                 ; $04B149   |
    BPL CODE_04B13C     ; $04B14A   |
    LDX $12             ; $04B14C   |
    LDA $0967           ; $04B14E   |
    STA $7A36,x         ; $04B151   |
    LDA #$1000          ; $04B154   |
    STA $7900,x         ; $04B157   |
    RTL                 ; $04B15A   |

.main_seesaw
    JSR CODE_04B2B3     ; $04B15B   |
    JSL $03AF23         ; $04B15E   |
    JSR CODE_04B169     ; $04B162   |
    JSR CODE_04B191     ; $04B165   |
    RTL                 ; $04B168   |

; seesaw sub

CODE_04B169:
    LDY #$04            ; $04B169   |
    JSR CODE_04AEDF     ; $04B16B   |
    SEC                 ; $04B16E   |
    SBC $00             ; $04B16F   |
    BPL CODE_04B177     ; $04B171   |
    EOR #$FFFF          ; $04B173   |
    INC A               ; $04B176   |

CODE_04B177:
    CLC                 ; $04B177   |
    ADC $75E0,x         ; $04B178   |
    CMP #$1000          ; $04B17B   |
    BMI CODE_04B18D     ; $04B17E   |
    PHA                 ; $04B180   |
    LDA #$001F          ; $04B181   |\ play sound #$001F
    JSL $0085D2         ; $04B184   |/
    PLA                 ; $04B188   |
    SEC                 ; $04B189   |
    SBC #$1000          ; $04B18A   |

CODE_04B18D:
    STA $75E0,x         ; $04B18D   |
    RTS                 ; $04B190   |

; seesaw sub

CODE_04B191:
    LDY $60AB           ; $04B191   |
    BPL CODE_04B19E     ; $04B194   |
    LDY $60C0           ; $04B196   |
    BEQ CODE_04B19E     ; $04B199   |
    JMP CODE_04B238     ; $04B19B   |

CODE_04B19E:
    LDA #$F800          ; $04B19E   |
    STA $3008           ; $04B1A1   |
    LDY $18,x           ; $04B1A4   |
    BEQ CODE_04B1C8     ; $04B1A6   |
    LDA $60FC           ; $04B1A8   |
    AND #$0007          ; $04B1AB   |
    BNE CODE_04B1C8     ; $04B1AE   |
    LDA $7E12           ; $04B1B0   |
    SEC                 ; $04B1B3   |
    SBC $608C           ; $04B1B4   |
    BPL CODE_04B1BD     ; $04B1B7   |
    EOR #$FFFF          ; $04B1B9   |
    INC A               ; $04B1BC   |

CODE_04B1BD:
    CLC                 ; $04B1BD   |
    ADC $6090           ; $04B1BE   |
    CLC                 ; $04B1C1   |
    ADC #$0004          ; $04B1C2   |
    STA $6090           ; $04B1C5   |

CODE_04B1C8:
    LDY #$08            ; $04B1C8   |
    LDA $611C           ; $04B1CA   |
    SEC                 ; $04B1CD   |
    SBC $7CD6,x         ; $04B1CE   |
    BMI CODE_04B1D5     ; $04B1D1   |
    INY                 ; $04B1D3   |
    INY                 ; $04B1D4   |

CODE_04B1D5:
    JSR CODE_04AF4D     ; $04B1D5   |
    LDA $603E           ; $04B1D8   |
    BEQ CODE_04B238     ; $04B1DB   |
    LDA $60FC           ; $04B1DD   |
    AND #$0007          ; $04B1E0   |
    BNE CODE_04B238     ; $04B1E3   |
    LDA $7CD8,x         ; $04B1E5   |
    CLC                 ; $04B1E8   |
    ADC $603C           ; $04B1E9   |
    SEC                 ; $04B1EC   |
    SBC $6112           ; $04B1ED   |
    SEC                 ; $04B1F0   |
    SBC #$0020          ; $04B1F1   |
    STA $6090           ; $04B1F4   |
    LDA $60AA           ; $04B1F7   |
    STA $3000           ; $04B1FA   |
    LDA #$0180          ; $04B1FD   |
    STA $300C           ; $04B200   |
    LDX #$0B            ; $04B203   |
    LDA #$86B6          ; $04B205   |
    JSL $7EDE44         ; $04B208   | GSU init
    LDX $12             ; $04B20C   |
    LDA $3000           ; $04B20E   |
    STZ $60AA           ; $04B211   |
    INC $61B4           ; $04B214   |
    LDY $18,x           ; $04B217   |
    BNE CODE_04B21F     ; $04B219   |
    INC $18,x           ; $04B21B   |
    BRA CODE_04B22C     ; $04B21D   |

CODE_04B21F:
    LDA $04             ; $04B21F   |
    BPL CODE_04B227     ; $04B221   |
    EOR #$FFFF          ; $04B223   |
    INC A               ; $04B226   |

CODE_04B227:
    ASL A               ; $04B227   |
    CLC                 ; $04B228   |
    ADC #$0100          ; $04B229   |

CODE_04B22C:
    STA $00             ; $04B22C   |
    LDY $02             ; $04B22E   |
    CPY #$01            ; $04B230   |
    BRA CODE_04B277     ; $04B232   |

DATA_04B234:         dw $0020, $0010

; seesaw sub

CODE_04B238:
    STZ $18,x           ; $04B238   |
    LDY #$00            ; $04B23A   |
    LDA $7A38,x         ; $04B23C   |
    EOR $7901,x         ; $04B23F   |
    BPL CODE_04B246     ; $04B242   |
    INY                 ; $04B244   |
    INY                 ; $04B245   |

CODE_04B246:
    LDA $7A38,x         ; $04B246   |
    BPL CODE_04B24F     ; $04B249   |
    EOR #$FFFF          ; $04B24B   |
    INC A               ; $04B24E   |

CODE_04B24F:
    STA $3000           ; $04B24F   |
    CMP #$0400          ; $04B252   |
    BPL CODE_04B25C     ; $04B255   |
    LDA #$0020          ; $04B257   |
    BRA CODE_04B270     ; $04B25A   |

CODE_04B25C:
    LDA $B234,y         ; $04B25C   |
    STA $300C           ; $04B25F   |
    LDX #$0B            ; $04B262   |
    LDA #$86B6          ; $04B264   |
    JSL $7EDE44         ; $04B267   | GSU init
    LDX $12             ; $04B26B   |
    LDA $3000           ; $04B26D   |

CODE_04B270:
    STA $00             ; $04B270   |
    LDY $7A39,x         ; $04B272   |
    CPY #$00            ; $04B275   |

CODE_04B277:
    BPL CODE_04B295     ; $04B277   |
    LDA $7900,x         ; $04B279   |
    CLC                 ; $04B27C   |
    ADC $00             ; $04B27D   |
    STA $7900,x         ; $04B27F   |
    LDA $7902,x         ; $04B282   |
    ADC #$0000          ; $04B285   |
    STA $7902,x         ; $04B288   |
    LDA #$0100          ; $04B28B   |
    CMP $7901,x         ; $04B28E   |
    BPL CODE_04B2B2     ; $04B291   |
    BRA CODE_04B2AF     ; $04B293   |

CODE_04B295:
    LDA $7900,x         ; $04B295   |
    SEC                 ; $04B298   |
    SBC $00             ; $04B299   |
    STA $7900,x         ; $04B29B   |
    LDA $7902,x         ; $04B29E   |
    SBC #$0000          ; $04B2A1   |
    STA $7902,x         ; $04B2A4   |
    LDA #$FF00          ; $04B2A7   |
    CMP $7901,x         ; $04B2AA   |
    BMI CODE_04B2B2     ; $04B2AD   |

CODE_04B2AF:
    STA $7901,x         ; $04B2AF   |

CODE_04B2B2:
    RTS                 ; $04B2B2   |

; seesaw sub

CODE_04B2B3:
    JSL $03A299         ; $04B2B3   |
    BCC CODE_04B2CF     ; $04B2B7   |
    LDY $78,x           ; $04B2B9   |
    BNE CODE_04B2CF     ; $04B2BB   |
    PLA                 ; $04B2BD   |
    LDY $16,x           ; $04B2BE   |
    BEQ CODE_04B2C9     ; $04B2C0   |
    STZ $0CB2           ; $04B2C2   |
    JMP CODE_0403A3     ; $04B2C5   |

CODE_04B2C9:
    INC $16,x           ; $04B2C9   |
    JSR CODE_04B601     ; $04B2CB   |
    RTL                 ; $04B2CE   |

CODE_04B2CF:
    LDA #$0004          ; $04B2CF   |
    STA $3002           ; $04B2D2   |
    LDA #$B32F          ; $04B2D5   |
    STA $3004           ; $04B2D8   |
    LDA $7A39,x         ; $04B2DB   |
    AND #$00FF          ; $04B2DE   |
    STA $3006           ; $04B2E1   |
    LDA $7680,x         ; $04B2E4   |
    CLC                 ; $04B2E7   |
    ADC #$0008          ; $04B2E8   |
    STA $6040           ; $04B2EB   |
    LDA $7682,x         ; $04B2EE   |
    CLC                 ; $04B2F1   |
    ADC #$0010          ; $04B2F2   |
    STA $6042           ; $04B2F5   |
    LDX #$08            ; $04B2F8   |
    LDA #$E447          ; $04B2FA   |
    JSL $7EDE44         ; $04B2FD   | GSU init
    REP #$10            ; $04B301   |
    JSL $00BE39         ; $04B303   |

; DMA args
DATA_04B307:         dl $7E5040, $703372
DATA_04B30D:         dw $0348

    SEP #$30            ; $04B30F   |
    LDA #$11            ; $04B311   |
    STA $0967           ; $04B313   |
    LDA #$06            ; $04B316   |
    STA $0968           ; $04B318   |
    LDA #$20            ; $04B31B   |
    STA $096C           ; $04B31D   |
    LDA #$08            ; $04B320   |
    TSB $095E           ; $04B322   |
    LDA #$18            ; $04B325   |
    TSB $094A           ; $04B327   |
    REP #$20            ; $04B32A   |
    LDX $12             ; $04B32C   |
    RTS                 ; $04B32E   |

; seesaw gsu table
DATA_04B32F:         dw $7410, $75F0
DATA_04B333:         dw $76F1, $77F3
DATA_04B337:         dw $77F6, $76FA
DATA_04B33B:         dw $75FD, $74FF
DATA_04B33F:         dw $8C00, $8B00
DATA_04B343:         dw $8AFF, $89FD
DATA_04B347:         dw $89FA, $8AF6
DATA_04B34B:         dw $8BF3, $8CF1
DATA_04B34F:         db $F0

init_bigger_boo_ptr:
DATA_04B350:         dw $B363
DATA_04B352:         dw $B467

.init_bigger_boo
    TXY                 ; $04B354   |
    LDA $76,x           ; $04B355   |
    ASL A               ; $04B357   |
    TAX                 ; $04B358   |
    JSR ($B350,x)       ; $04B359   |
    LDA #$0002          ; $04B35C   |
    STA $6F00,x         ; $04B35F   |
    RTL                 ; $04B362   |

; init_bigger_boo_ptr sub
    TYX                 ; $04B363   |
    LDA #$0000          ; $04B364   |
    STA $70336C         ; $04B367   |
    STZ $1060           ; $04B36B   |
    SEP #$20            ; $04B36E   |
    LDA #$61            ; $04B370   |
    STA $095E           ; $04B372   |
    LDA #$22            ; $04B375   |
    STA $096B           ; $04B377   |
    REP #$20            ; $04B37A   |
    LDY $013A           ; $04B37C   |
    CPY #$16            ; $04B37F   |
    BEQ CODE_04B386     ; $04B381   |
    JMP CODE_04B42D     ; $04B383   |

CODE_04B386:
    INC $1060           ; $04B386   |
    LDA #$0001          ; $04B389   |
    STA $1064           ; $04B38C   |
    LDA $608C           ; $04B38F   |
    CMP #$0C38          ; $04B392   |
    BMI CODE_04B3B2     ; $04B395   |
    LDA #$00F1          ; $04B397   |
    STA $004D           ; $04B39A   |
    JSL $03AD74         ; $04B39D   |
    BCC CODE_04B3B2     ; $04B3A1   |
    LDY $7722,x         ; $04B3A3   |
    STY $77,x           ; $04B3A6   |
    JSL $03AD74         ; $04B3A8   |
    BCS CODE_04B3B3     ; $04B3AC   |
    JSL $03AEFD         ; $04B3AE   |

CODE_04B3B2:
    RTS                 ; $04B3B2   |

CODE_04B3B3:
    STZ $60A8           ; $04B3B3   |
    STZ $60B4           ; $04B3B6   |
    JSL $04F74A         ; $04B3B9   |
    LDA #$0048          ; $04B3BD   |
    JSL $03A34C         ; $04B3C0   |
    LDA #$0000          ; $04B3C4   |
    STA $70E2,y         ; $04B3C7   |
    LDA $6094           ; $04B3CA   |
    SEC                 ; $04B3CD   |
    SBC #$0060          ; $04B3CE   |
    STA $70E2,x         ; $04B3D1   |
    LDA $6090           ; $04B3D4   |
    SEC                 ; $04B3D7   |
    SBC #$0020          ; $04B3D8   |
    STA $7182,x         ; $04B3DB   |
    LDA #$0003          ; $04B3DE   |
    STA $74A2,x         ; $04B3E1   |
    LDA #$0004          ; $04B3E4   |
    STA $7542,x         ; $04B3E7   |
    LDA #$0080          ; $04B3EA   |
    STA $7220,x         ; $04B3ED   |
    LDA #$0002          ; $04B3F0   |
    STA $7400,x         ; $04B3F3   |
    LDY #$04            ; $04B3F6   |
    STY $76,x           ; $04B3F8   |
    LDX #$20            ; $04B3FA   |

CODE_04B3FC:
    LDA $702E8C,x       ; $04B3FC   |
    STA $7021C0,x       ; $04B400   |
    DEX                 ; $04B404   |
    DEX                 ; $04B405   |
    BPL CODE_04B3FC     ; $04B406   |
    LDX #$C0            ; $04B408   |
    LDA #$0000          ; $04B40A   |

CODE_04B40D:
    STA $702F6A,x       ; $04B40D   |
    DEX                 ; $04B411   |
    DEX                 ; $04B412   |
    BNE CODE_04B40D     ; $04B413   |
    LDX #$20            ; $04B415   |

CODE_04B417:
    LDA $7020BE,x       ; $04B417   |
    STA $70302A,x       ; $04B41B   |
    LDA $7020DE,x       ; $04B41F   |
    STA $70304A,x       ; $04B423   |
    DEX                 ; $04B427   |
    DEX                 ; $04B428   |
    BNE CODE_04B417     ; $04B429   |
    BRA CODE_04B44A     ; $04B42B   |

CODE_04B42D:
    INC $76,x           ; $04B42D   |
    LDX #$20            ; $04B42F   |

CODE_04B431:
    LDA $701FFE,x       ; $04B431   |
    STA $702F6A,x       ; $04B435   |
    DEX                 ; $04B439   |
    DEX                 ; $04B43A   |
    BNE CODE_04B431     ; $04B43B   |
    LDX #$E0            ; $04B43D   |
    LDA #$0000          ; $04B43F   |

CODE_04B442:
    STA $702F8A,x       ; $04B442   |
    DEX                 ; $04B446   |
    DEX                 ; $04B447   |
    BNE CODE_04B442     ; $04B448   |

CODE_04B44A:
    LDX #$00            ; $04B44A   |

CODE_04B44C:
    LDA $7020FE,x       ; $04B44C   |
    STA $70306A,x       ; $04B450   |
    DEX                 ; $04B454   |
    DEX                 ; $04B455   |
    BNE CODE_04B44C     ; $04B456   |
    LDX $12             ; $04B458   |
    LDY $1060           ; $04B45A   |
    BEQ CODE_04B48A     ; $04B45D   |
    LDA #$0080          ; $04B45F   |
    STA $7A98,x         ; $04B462   |
    PLA                 ; $04B465   | go up 2 return addresses
    RTL                 ; $04B466   |

; init_bigger_boo_ptr sub
    TYX                 ; $04B467   |
    LDA $70336C         ; $04B468   |
    CMP #$0011          ; $04B46C   |
    BPL CODE_04B48B     ; $04B46F   |
    LDA #$2D6C          ; $04B471   |
    STA $70336E         ; $04B474   |
    LDA #$2F6C          ; $04B478   |
    STA $703370         ; $04B47B   |
    LDX #$08            ; $04B47F   |
    LDA #$B4A9          ; $04B481   |
    JSL $7EDE44         ; $04B484   | GSU init
    LDX $12             ; $04B488   |

CODE_04B48A:
    RTS                 ; $04B48A   |

CODE_04B48B:
    JSL $03AD74         ; $04B48B   |
    BCC CODE_04B4A0     ; $04B48F   |
    LDY $7722,x         ; $04B491   |
    STY $77,x           ; $04B494   |
    JSL $03AD74         ; $04B496   |
    BCS CODE_04B4A1     ; $04B49A   |
    JSL $03AEFD         ; $04B49C   |

CODE_04B4A0:
    RTS                 ; $04B4A0   |

CODE_04B4A1:
    LDA $5FDFF4         ; $04B4A1   |
    STA $702D76         ; $04B4A5   |
    LDA $5FDFF6         ; $04B4A9   |
    STA $702D78         ; $04B4AD   |
    LDY $7400,x         ; $04B4B1   |
    STY $18,x           ; $04B4B4   |
    LDX #$00            ; $04B4B6   |

CODE_04B4B8:
    LDA $701FFE,x       ; $04B4B8   |
    STA $702F6A,x       ; $04B4BC   |
    LDA $702D6A,x       ; $04B4C0   |
    STA $701FFE,x       ; $04B4C4   |
    DEX                 ; $04B4C8   |
    DEX                 ; $04B4C9   |
    BNE CODE_04B4B8     ; $04B4CA   |
    LDX $12             ; $04B4CC   |
    LDY #$00            ; $04B4CE   |
    STY $76,x           ; $04B4D0   |
    LDA #$0009          ; $04B4D2   |
    STA $004D           ; $04B4D5   |
    PLA                 ; $04B4D8   | go up 2 return addresses
    RTL                 ; $04B4D9   |

bigger_boo_ptr:
; behavioral
DATA_04B4DA:         dw $BA6D                ; 00: moving toward yoshi or disappear if he looks
DATA_04B4DC:         dw $BAA2                ; 01: turning around because yoshi is now on the other side

; death cinematics
DATA_04B4DE:         dw $BAC4                ; 02: flashing and growing
DATA_04B4E0:         dw $BB6B                ; 03: yellow explosion graphic (final state)

; intro cinematics
DATA_04B4E2:         dw $BB8F                ; 04: small boo moving towards yoshi
DATA_04B4E4:         dw $BC08                ; 05: bobbing up & down, waiting on kamek
DATA_04B4E6:         dw $BC43                ; 06: screen darkening
DATA_04B4E8:         dw $BD41                ; 07: growing

.main_bigger_boo
    LDY $76,x           ; $04B4EA   |
    CPY #$03            ; $04B4EC   |
    BEQ CODE_04B4F8     ; $04B4EE   |
    LDA $7040,x         ; $04B4F0   |
    AND #$0001          ; $04B4F3   |
    BEQ CODE_04B4FE     ; $04B4F6   |

CODE_04B4F8:
    JSL $03AF23         ; $04B4F8   |
    BRA CODE_04B50B     ; $04B4FC   |

CODE_04B4FE:
    JSR CODE_04B541     ; $04B4FE   |
    JSR CODE_04B5A2     ; $04B501   |
    JSL $03AF23         ; $04B504   |
    JSR CODE_04B712     ; $04B508   |

CODE_04B50B:
    LDY $76,x           ; $04B50B   |
    TYA                 ; $04B50D   |
    ASL A               ; $04B50E   |
    TXY                 ; $04B50F   |
    TAX                 ; $04B510   |
    JSR ($B4DA,x)       ; $04B511   |
    LDY $76,x           ; $04B514   |
    CPY #$02            ; $04B516   |
    BPL CODE_04B52C     ; $04B518   |
    JSR CODE_04B905     ; $04B51A   |
    JSR CODE_04B9C5     ; $04B51D   |
    JSR CODE_04B645     ; $04B520   |
    JSR CODE_04B6D4     ; $04B523   |
    JSR CODE_04B808     ; $04B526   |
    JSR CODE_04B8E4     ; $04B529   |

CODE_04B52C:
    LDY $1066           ; $04B52C   |
    BEQ CODE_04B540     ; $04B52F   |
    LDA $7A36,x         ; $04B531   |
    CMP $16,x           ; $04B534   |
    BNE CODE_04B540     ; $04B536   |
    LDY $7D36,x         ; $04B538   |
    BMI CODE_04B540     ; $04B53B   |
    STZ $1066           ; $04B53D   |

CODE_04B540:
    RTL                 ; $04B540   |

; bigger boo sub

CODE_04B541:
    LDY $74A2,x         ; $04B541   |
    BMI CODE_04B54B     ; $04B544   |
    LDA $7362,x         ; $04B546   |
    BPL CODE_04B54C     ; $04B549   |

CODE_04B54B:
    RTS                 ; $04B54B   |

CODE_04B54C:
    JSL $03AA52         ; $04B54C   |
    REP #$10            ; $04B550   |
    LDA $7362,x         ; $04B552   |
    CLC                 ; $04B555   |
    ADC #$0020          ; $04B556   |
    TAY                 ; $04B559   |
    LDA $7722,x         ; $04B55A   |
    PHA                 ; $04B55D   |
    LDA $77,x           ; $04B55E   |
    AND #$00FF          ; $04B560   |
    STA $7722,x         ; $04B563   |
    JSL $03AA60         ; $04B566   |
    PLA                 ; $04B56A   |
    STA $7722,x         ; $04B56B   |
    LDA $7680,x         ; $04B56E   |
    STA $3002           ; $04B571   |
    LDA $7682,x         ; $04B574   |
    STA $3004           ; $04B577   |
    LDA $105C           ; $04B57A   |
    STA $3006           ; $04B57D   |
    LDA #$FFF0          ; $04B580   |
    STA $300A           ; $04B583   |
    LDA $7A36,x         ; $04B586   |
    STA $300C           ; $04B589   |
    LDA $7400,x         ; $04B58C   |
    STA $3010           ; $04B58F   |
    TXA                 ; $04B592   |
    STA $3014           ; $04B593   |
    LDX #$08            ; $04B596   |
    LDA #$A248          ; $04B598   |
    JSL $7EDE44         ; $04B59B   | GSU init
    LDX $12             ; $04B59F   |
    RTS                 ; $04B5A1   |

; bigger boo sub

CODE_04B5A2:
    LDA #$0004          ; $04B5A2   |
    STA $3000           ; $04B5A5   |
    LDY $18,x           ; $04B5A8   |
    LDA $BD83,y         ; $04B5AA   |
    STA $3002           ; $04B5AD   |
    LDA $7A36,x         ; $04B5B0   |
    STA $3004           ; $04B5B3   |
    STA $3006           ; $04B5B6   |
    LDA $7680,x         ; $04B5B9   |
    CLC                 ; $04B5BC   |
    ADC #$0008          ; $04B5BD   |
    STA $6000           ; $04B5C0   |
    LDA $7682,x         ; $04B5C3   |
    STA $6002           ; $04B5C6   |
    STZ $6004           ; $04B5C9   |
    STZ $6006           ; $04B5CC   |
    STZ $600E           ; $04B5CF   |
    LDA #$3516          ; $04B5D2   |
    STA $600A           ; $04B5D5   |
    LDA #$3372          ; $04B5D8   |
    STA $600C           ; $04B5DB   |
    LDX #$08            ; $04B5DE   |
    LDA #$E315          ; $04B5E0   |
    JSL $7EDE44         ; $04B5E3   | GSU init
    REP #$10            ; $04B5E7   |
    JSL $00BE39         ; $04B5E9   |

DATA_04B5ED:         db $40, $50, $7E, $72
DATA_04B5F1:         db $33, $70, $48, $03

; execution continues here
    SEP #$30            ; $04B5F5   |
    LDA #$18            ; $04B5F7   |
    TSB $094A           ; $04B5F9   |
    REP #$20            ; $04B5FC   |
    LDX $12             ; $04B5FE   |
    RTS                 ; $04B600   |

; bigger boo sub

CODE_04B601:
    LDX #$08            ; $04B601   |
    LDA #$D46A          ; $04B603   |
    JSL $7EDE44         ; $04B606   | GSU init
    REP #$10            ; $04B60A   |
    JSL $00BE39         ; $04B60C   |

DATA_04B610:         db $40, $50, $7E, $72
DATA_04B614:         db $33, $70, $48, $03

; execution continues here
    SEP #$10            ; $04B618   |
    REP #$20            ; $04B61A   |
    LDX $12             ; $04B61C   |
    LDA $7360,x         ; $04B61E   |
    CMP #$003D          ; $04B621   |
    BNE CODE_04B62B     ; $04B624   |
    LDA $7A36,x         ; $04B626   |
    BRA CODE_04B638     ; $04B629   |

CODE_04B62B:
    LDY $1060           ; $04B62B   |
    BNE CODE_04B635     ; $04B62E   |
    LDA #$0314          ; $04B630   |
    BRA CODE_04B638     ; $04B633   |

CODE_04B635:
    LDA #$0512          ; $04B635   |

CODE_04B638:
    STA $0967           ; $04B638   |
    SEP #$20            ; $04B63B   |
    LDA #$18            ; $04B63D   |
    TSB $094A           ; $04B63F   |
    REP #$20            ; $04B642   |
    RTS                 ; $04B644   |

; bigger boo sub

CODE_04B645:
    LDA $7A36,x         ; $04B645   |
    CMP $16,x           ; $04B648   |
    BMI CODE_04B69A     ; $04B64A   |
    LDY $77C2,x         ; $04B64C   |
    TYA                 ; $04B64F   |
    STA $00             ; $04B650   |
    LDY $18,x           ; $04B652   |
    CPY #$04            ; $04B654   |
    BMI CODE_04B69B     ; $04B656   |
    CPY #$08            ; $04B658   |
    BEQ CODE_04B69A     ; $04B65A   |
    LDY $7D36,x         ; $04B65C   |
    BMI CODE_04B69A     ; $04B65F   |
    LDA $00             ; $04B661   |
    CMP $7400,x         ; $04B663   |
    BEQ CODE_04B66F     ; $04B666   |
    LDY #$01            ; $04B668   |
    STY $79,x           ; $04B66A   |
    STY $76,x           ; $04B66C   |
    RTS                 ; $04B66E   |

CODE_04B66F:
    LDA $60C4           ; $04B66F   |
    CMP $7400,x         ; $04B672   |
    BNE CODE_04B67B     ; $04B675   |
    CMP $00             ; $04B677   |
    BEQ CODE_04B694     ; $04B679   |

CODE_04B67B:
    LDA $7AF8,x         ; $04B67B   |
    BNE CODE_04B69A     ; $04B67E   |
    LDY $76,x           ; $04B680   |
    CPY #$01            ; $04B682   |
    BEQ CODE_04B694     ; $04B684   |
    LDY $18,x           ; $04B686   |
    TYA                 ; $04B688   |
    AND #$0002          ; $04B689   |
    TAY                 ; $04B68C   |
    STY $18,x           ; $04B68D   |
    LDY #$F8            ; $04B68F   |
    STY $19,x           ; $04B691   |
    RTS                 ; $04B693   |

CODE_04B694:
    LDA #$0020          ; $04B694   |
    STA $7AF8,x         ; $04B697   |

CODE_04B69A:
    RTS                 ; $04B69A   |

CODE_04B69B:
    LDA $7400,x         ; $04B69B   |
    DEC A               ; $04B69E   |
    EOR $7C16,x         ; $04B69F   |
    BPL CODE_04B6B9     ; $04B6A2   |
    LDY $1066           ; $04B6A4   |
    BNE CODE_04B6B9     ; $04B6A7   |
    LDY #$F8            ; $04B6A9   |
    STY $19,x           ; $04B6AB   |
    LDA $60C4           ; $04B6AD   |
    CMP $7400,x         ; $04B6B0   |
    BNE CODE_04B6D3     ; $04B6B3   |
    CMP $00             ; $04B6B5   |
    BNE CODE_04B6D3     ; $04B6B7   |

CODE_04B6B9:
    LDY $18,x           ; $04B6B9   |
    TYA                 ; $04B6BB   |
    CLC                 ; $04B6BC   |
    ADC #$0004          ; $04B6BD   |
    TAY                 ; $04B6C0   |
    STY $18,x           ; $04B6C1   |
    STZ $7220,x         ; $04B6C3   |
    STZ $7222,x         ; $04B6C6   |
    STZ $7540,x         ; $04B6C9   |
    STZ $7542,x         ; $04B6CC   |
    LDY #$08            ; $04B6CF   |
    STY $19,x           ; $04B6D1   |

CODE_04B6D3:
    RTS                 ; $04B6D3   |

; bigger boo sub

CODE_04B6D4:
    LDY $79,x           ; $04B6D4   |
    BEQ CODE_04B711     ; $04B6D6   |
    LDA $7AF6,x         ; $04B6D8   |
    BNE CODE_04B711     ; $04B6DB   |
    LDA #$0002          ; $04B6DD   |
    STA $7AF6,x         ; $04B6E0   |
    TYA                 ; $04B6E3   |
    CPY #$00            ; $04B6E4   |
    BPL CODE_04B6EB     ; $04B6E6   |
    ORA #$FF00          ; $04B6E8   |

CODE_04B6EB:
    CLC                 ; $04B6EB   |
    ADC $105C           ; $04B6EC   |
    CMP #$FFF4          ; $04B6EF   |
    BNE CODE_04B705     ; $04B6F2   |
    STA $105C           ; $04B6F4   |
    LDA $7400,x         ; $04B6F7   |
    EOR #$0002          ; $04B6FA   |
    STA $7400,x         ; $04B6FD   |
    LDY #$FF            ; $04B700   |
    STY $79,x           ; $04B702   |
    RTS                 ; $04B704   |

CODE_04B705:
    CMP #$FFEC          ; $04B705   |
    BNE CODE_04B70E     ; $04B708   |
    LDY #$00            ; $04B70A   |
    STY $79,x           ; $04B70C   |

CODE_04B70E:
    STA $105C           ; $04B70E   |

CODE_04B711:
    RTS                 ; $04B711   |

; bigger boo sub

CODE_04B712:
    LDA $16,x           ; $04B712   |
    LDY $76,x           ; $04B714   |
    CPY #$07            ; $04B716   |
    BEQ CODE_04B745     ; $04B718   |
    CPY #$04            ; $04B71A   |
    BPL CODE_04B72E     ; $04B71C   |
    CPY #$02            ; $04B71E   |
    BEQ CODE_04B748     ; $04B720   |
    LDA $7A36,x         ; $04B722   |
    CMP $16,x           ; $04B725   |
    BPL CODE_04B72E     ; $04B727   |
    LDA #$0002          ; $04B729   |
    BRA CODE_04B742     ; $04B72C   |

CODE_04B72E:
    LDA $18,x           ; $04B72E   |
    BIT #$0008          ; $04B730   |
    BEQ CODE_04B738     ; $04B733   |
    LDA #$0004          ; $04B735   |

CODE_04B738:
    AND #$0004          ; $04B738   |
    LSR A               ; $04B73B   |
    LSR A               ; $04B73C   |
    CMP $7402,x         ; $04B73D   |
    BEQ CODE_04B7AD     ; $04B740   |

CODE_04B742:
    STA $7402,x         ; $04B742   |

CODE_04B745:
    LDA $7A36,x         ; $04B745   |

CODE_04B748:
    SEC                 ; $04B748   |
    SBC #$01C0          ; $04B749   |
    STA $3000           ; $04B74C   |
    LDA #$FF90          ; $04B74F   |
    STA $300C           ; $04B752   |
    LDX #$0B            ; $04B755   |
    LDA #$86B6          ; $04B757   |
    JSL $7EDE44         ; $04B75A   | GSU init
    LDX $12             ; $04B75E   |
    LDA #$0100          ; $04B760   |
    SEC                 ; $04B763   |
    SBC $3000           ; $04B764   |
    STA $04             ; $04B767   |
    LDY $76,x           ; $04B769   |
    CPY #$02            ; $04B76B   |
    BNE CODE_04B772     ; $04B76D   |
    LDA #$0100          ; $04B76F   |

CODE_04B772:
    STA $02             ; $04B772   |
    LDA $7722,x         ; $04B774   |
    STA $06             ; $04B777   |
    LDY $77,x           ; $04B779   |
    TYA                 ; $04B77B   |
    STA $08             ; $04B77C   |
    LDY $7402,x         ; $04B77E   |
    DEY                 ; $04B781   |
    BEQ CODE_04B7A0     ; $04B782   |
    BMI CODE_04B793     ; $04B784   |
    LDY #$06            ; $04B786   |
    JSR CODE_04B7CC     ; $04B788   |
    LDA $08             ; $04B78B   |
    STA $06             ; $04B78D   |
    LDY #$08            ; $04B78F   |
    BRA CODE_04B7A2     ; $04B791   |

CODE_04B793:
    LDY #$00            ; $04B793   |
    JSR CODE_04B7CC     ; $04B795   |
    LDA $08             ; $04B798   |
    STA $06             ; $04B79A   |
    LDY #$02            ; $04B79C   |
    BRA CODE_04B7A2     ; $04B79E   |

CODE_04B7A0:
    LDY #$04            ; $04B7A0   |

CODE_04B7A2:
    JSR CODE_04B7CC     ; $04B7A2   |
    LDX $12             ; $04B7A5   |
    INC $0CF9           ; $04B7A7   |
    JSR CODE_04B541     ; $04B7AA   |

CODE_04B7AD:
    RTS                 ; $04B7AD   |

; bigger boo tables
DATA_04B7AE:         dw $4041
DATA_04B7B0:         dw $6041
DATA_04B7B2:         dw $4061
DATA_04B7B4:         dw $2001
DATA_04B7B6:         dw $6061

DATA_04B7B8:         dw $0055
DATA_04B7BA:         dw $0055
DATA_04B7BC:         dw $0055
DATA_04B7BE:         dw $0055
DATA_04B7C0:         dw $0056

DATA_04B7C2:         dw $0020
DATA_04B7C4:         dw $0000
DATA_04B7C6:         dw $0010
DATA_04B7C8:         dw $0020
DATA_04B7CA:         dw $0000

; bigger boo sub

CODE_04B7CC:
    LDA $B7AE,y         ; $04B7CC   | table
    STA $3018           ; $04B7CF   |
    LDA $B7B8,y         ; $04B7D2   | table
    STA $301A           ; $04B7D5   |
    LDA $02             ; $04B7D8   |
    STA $3016           ; $04B7DA   |
    LDA $04             ; $04B7DD   |
    STA $300C           ; $04B7DF   |
    LDA #$0010          ; $04B7E2   |
    STA $3010           ; $04B7E5   |
    LDA $B7C2,y         ; $04B7E8   | table
    STA $3012           ; $04B7EB   |
    LDX $06             ; $04B7EE   |
    LDA $03A9CE,x       ; $04B7F0   |
    STA $3006           ; $04B7F4   |
    LDA $03A9EE,x       ; $04B7F7   |
    STA $3004           ; $04B7FB   |
    LDX #$08            ; $04B7FE   |
    LDA #$8295          ; $04B800   |
    JSL $7EDE44         ; $04B803   | GSU init
    RTS                 ; $04B807   |

; bigger boo sub

CODE_04B808:
    LDY $78,x           ; $04B808   |
    BNE CODE_04B81E     ; $04B80A   |
    LDA $16,x           ; $04B80C   |
    CMP $7A36,x         ; $04B80E   |
    BNE CODE_04B81E     ; $04B811   |
    LDY $19,x           ; $04B813   |
    DEY                 ; $04B815   |
    BPL CODE_04B81E     ; $04B816   |
    JSR CODE_04B81F     ; $04B818   |
    JSR CODE_04B82E     ; $04B81B   |

CODE_04B81E:
    RTS                 ; $04B81E   |

; bigger boo sub

CODE_04B81F:
    LDY $7D36,x         ; $04B81F   |
    BPL CODE_04B82D     ; $04B822   |
    LDY $1066           ; $04B824   |
    BNE CODE_04B82D     ; $04B827   |
    JSL $03A858         ; $04B829   |

CODE_04B82D:
    RTS                 ; $04B82D   |

; bigger boo sub

CODE_04B82E:
    TXA                 ; $04B82E   |
    STA $3002           ; $04B82F   |
    LDX #$09            ; $04B832   |
    LDA #$8F33          ; $04B834   |
    JSL $7EDE44         ; $04B837   | GSU init
    LDX $12             ; $04B83B   |
    LDY $3002           ; $04B83D   |
    BMI CODE_04B82D     ; $04B840   |
    LDA $7BB6,x         ; $04B842   |
    CLC                 ; $04B845   |
    ADC $7BB6,y         ; $04B846   |
    ASL A               ; $04B849   |
    STA $00             ; $04B84A   |
    LSR A               ; $04B84C   |
    CLC                 ; $04B84D   |
    ADC $7CD6,y         ; $04B84E   |
    SEC                 ; $04B851   |
    SBC $7CD6,x         ; $04B852   |
    CMP $00             ; $04B855   |
    BCS CODE_04B82D     ; $04B857   |
    LDA $7BB8,x         ; $04B859   |
    CLC                 ; $04B85C   |
    ADC $7BB8,y         ; $04B85D   |
    ASL A               ; $04B860   |
    STA $00             ; $04B861   |
    LSR A               ; $04B863   |
    CLC                 ; $04B864   |
    ADC $7CD8,y         ; $04B865   |
    SEC                 ; $04B868   |
    SBC $7CD8,x         ; $04B869   |
    CMP $00             ; $04B86C   |
    BCS CODE_04B82D     ; $04B86E   |
    LDA $7360,y         ; $04B870   |
    CMP #$0022          ; $04B873   |
    BCC CODE_04B82D     ; $04B876   |
    CMP #$002C          ; $04B878   |
    BCS CODE_04B82D     ; $04B87B   |
    PHY                 ; $04B87D   |
    TYX                 ; $04B87E   |
    JSL $03B25B         ; $04B87F   |
    PLY                 ; $04B883   |
    LDA $7A36,x         ; $04B884   |
    CMP $16,x           ; $04B887   |
    BNE CODE_04B8E3     ; $04B889   |
    LDA $7978,y         ; $04B88B   |
    CMP #$0002          ; $04B88E   |
    BPL CODE_04B8E3     ; $04B891   |
    STZ $7220,x         ; $04B893   |
    STZ $7222,x         ; $04B896   |
    STZ $7540,x         ; $04B899   |
    STZ $7542,x         ; $04B89C   |
    INC $1066           ; $04B89F   |
    LDA #$0078          ; $04B8A2   |\ play sound #$0078
    JSL $0085D2         ; $04B8A5   |/
    LDA $16,x           ; $04B8A9   | \
    CLC                 ; $04B8AB   |  |
    ADC #$0018          ; $04B8AC   |  |
    STA $105E           ; $04B8AF   |  | grow and check for dead
    CLC                 ; $04B8B2   |  | + $30 > $01C1 == dead
    ADC #$0030          ; $04B8B3   |  |
    CMP #$01C1          ; $04B8B6   |  |
    BMI CODE_04B8DF     ; $04B8B9   |  |
    STA $16,x           ; $04B8BB   | /
    LDY #$08            ; $04B8BD   |
    STY $19,x           ; $04B8BF   |
    JSL $02A982         ; $04B8C1   |
    STZ $0C48           ; $04B8C5   |
    LDA #$0000          ; $04B8C8   |
    STA $70336C         ; $04B8CB   |
    LDA #$0002          ; $04B8CF   |
    STA $7402,x         ; $04B8D2   |
    INC $0B7B           ; $04B8D5   |
    LDY #$02            ; $04B8D8   |
    STY $76,x           ; $04B8DA   |
    JMP CODE_04BB4E     ; $04B8DC   |

CODE_04B8DF:
    STA $16,x           ; $04B8DF   |
    INC $78,x           ; $04B8E1   |

CODE_04B8E3:
    RTS                 ; $04B8E3   |

; bigger boo sub

CODE_04B8E4:
    LDA #$0030          ; $04B8E4   |
    STA $300C           ; $04B8E7   |
    LDA $7A36,x         ; $04B8EA   |
    STA $3000           ; $04B8ED   |
    LDX #$0B            ; $04B8F0   |
    LDA #$86B6          ; $04B8F2   |
    JSL $7EDE44         ; $04B8F5   | GSU init
    LDX $12             ; $04B8F9   |
    LDA $3000           ; $04B8FB   |
    STA $7BB6,x         ; $04B8FE   |
    STA $7BB8,x         ; $04B901   |
    RTS                 ; $04B904   |

; bigger boo sub

CODE_04B905:
    LDY #$60            ; $04B905   |
    LDA $78,x           ; $04B907   |
    AND #$00FF          ; $04B909   |
    BEQ CODE_04B917     ; $04B90C   |
    LDY #$64            ; $04B90E   |
    LDA $1060           ; $04B910   |
    BEQ CODE_04B917     ; $04B913   |
    LDY #$62            ; $04B915   |

CODE_04B917:
    STY $096C           ; $04B917   |
    LDY $19,x           ; $04B91A   |
    BEQ CODE_04B941     ; $04B91C   |
    TYA                 ; $04B91E   |
    CPY #$00            ; $04B91F   |
    BPL CODE_04B926     ; $04B921   |
    ORA #$FF00          ; $04B923   |

CODE_04B926:
    STA $00             ; $04B926   |
    LDY $78,x           ; $04B928   |
    TYA                 ; $04B92A   |
    CLC                 ; $04B92B   |
    ADC $00             ; $04B92C   |
    BMI CODE_04B939     ; $04B92E   |
    CMP #$0100          ; $04B930   |
    BMI CODE_04B942     ; $04B933   |
    LDY #$FF            ; $04B935   |
    BRA CODE_04B93B     ; $04B937   |

CODE_04B939:
    LDY #$00            ; $04B939   |

CODE_04B93B:
    STY $78,x           ; $04B93B   |
    LDY #$00            ; $04B93D   |
    STY $19,x           ; $04B93F   |

CODE_04B941:
    RTS                 ; $04B941   |

CODE_04B942:
    TAY                 ; $04B942   |
    STY $78,x           ; $04B943   |
    STA $300C           ; $04B945   |
    LDY $1060           ; $04B948   |
    BNE CODE_04B970     ; $04B94B   |
    LDA #$DFF8          ; $04B94D   |
    STA $301C           ; $04B950   |
    LDA #$005F          ; $04B953   |
    STA $3000           ; $04B956   |
    LDA #$0005          ; $04B959   |
    STA $3010           ; $04B95C   |
    LDA #$0002          ; $04B95F   |
    STA $3018           ; $04B962   |
    LDX #$08            ; $04B965   |
    LDA #$E167          ; $04B967   |
    JSL $7EDE44         ; $04B96A   | GSU init
    BRA CODE_04B9B2     ; $04B96E   |

CODE_04B970:
    LDA #$E878          ; $04B970   |
    STA $301C           ; $04B973   |
    LDA #$005F          ; $04B976   |
    STA $3000           ; $04B979   |
    LDA #$0061          ; $04B97C   |
    STA $3010           ; $04B97F   |
    LDA #$000E          ; $04B982   |
    STA $3018           ; $04B985   |
    LDX #$08            ; $04B988   |
    LDA #$E167          ; $04B98A   |
    JSL $7EDE44         ; $04B98D   | GSU init
    LDA #$E894          ; $04B991   |
    STA $301C           ; $04B994   |
    LDA #$005F          ; $04B997   |
    STA $3000           ; $04B99A   |
    LDA #$0071          ; $04B99D   |
    STA $3010           ; $04B9A0   |
    LDA #$000E          ; $04B9A3   |
    STA $3018           ; $04B9A6   |
    LDX #$08            ; $04B9A9   |
    LDA #$E167          ; $04B9AB   |
    JSL $7EDE44         ; $04B9AE   | GSU init

CODE_04B9B2:
    LDX $12             ; $04B9B2   |
    RTS                 ; $04B9B4   |

DATA_04B9B5:         dw $7F26
DATA_04B9B7:         dw $7FFF
DATA_04B9B9:         dw $6F35
DATA_04B9BB:         dw $0000

DATA_04B9BD:         dw $7F26
DATA_04B9BF:         dw $477F
DATA_04B9C1:         dw $323F
DATA_04B9C3:         dw $7FFF

; bigger boo sub

CODE_04B9C5:
    LDY $1064           ; $04B9C5   |
    BNE CODE_04B9F8     ; $04B9C8   |
    LDA $7A36,x         ; $04B9CA   |
    CMP $16,x           ; $04B9CD   |
    BPL CODE_04B9F8     ; $04B9CF   |
    LDY $0CE8           ; $04B9D1   |
    BEQ CODE_04B9DD     ; $04B9D4   |
    LDA $1060           ; $04B9D6   |
    BNE CODE_04BA0B     ; $04B9D9   |
    BRA CODE_04BA19     ; $04B9DB   |

CODE_04B9DD:
    CMP $105E           ; $04B9DD   |
    BMI CODE_04B9F9     ; $04B9E0   |
    LDA #$0020          ; $04B9E2   |
    STA $0CE8           ; $04B9E5   |
    LDA $105E           ; $04B9E8   |
    CLC                 ; $04B9EB   |
    ADC #$0018          ; $04B9EC   |
    CMP $16,x           ; $04B9EF   |
    BMI CODE_04B9F5     ; $04B9F1   |
    LDA $16,x           ; $04B9F3   |

CODE_04B9F5:
    STA $105E           ; $04B9F5   |

CODE_04B9F8:
    RTS                 ; $04B9F8   |

CODE_04B9F9:
    CLC                 ; $04B9F9   |
    ADC #$0008          ; $04B9FA   |
    STA $7A36,x         ; $04B9FD   |
    CMP $16,x           ; $04BA00   |
    BMI CODE_04BA0B     ; $04BA02   |
    LDY $1060           ; $04BA04   |
    BEQ CODE_04BA19     ; $04BA07   |
    BRA CODE_04BA3B     ; $04BA09   |

CODE_04BA0B:
    LDA $7974           ; $04BA0B   |
    LDY $1060           ; $04BA0E   |
    BNE CODE_04BA36     ; $04BA11   |
    AND #$0002          ; $04BA13   |
    ASL A               ; $04BA16   |
    ASL A               ; $04BA17   |
    TAY                 ; $04BA18   |

CODE_04BA19:
    LDA $B9B5,y         ; $04BA19   | tables
    STA $702008         ; $04BA1C   |
    LDA $B9B7,y         ; $04BA20   |
    STA $70200A         ; $04BA23   |
    LDA $B9B9,y         ; $04BA27   |
    STA $70200C         ; $04BA2A   |
    LDA $B9BB,y         ; $04BA2E   |
    STA $70200E         ; $04BA31   |
    RTS                 ; $04BA35   |

CODE_04BA36:
    AND #$0002          ; $04BA36   |
    BNE CODE_04BA54     ; $04BA39   |

CODE_04BA3B:
    LDX #$1C            ; $04BA3B   |

CODE_04BA3D:
    LDA $5FE83E,x       ; $04BA3D   |
    STA $7020C0,x       ; $04BA41   |
    LDA $5FE85A,x       ; $04BA45   |
    STA $7020E0,x       ; $04BA49   |
    DEX                 ; $04BA4D   |
    DEX                 ; $04BA4E   |
    BNE CODE_04BA3D     ; $04BA4F   |
    LDX $12             ; $04BA51   |
    RTS                 ; $04BA53   |

CODE_04BA54:
    LDX #$1C            ; $04BA54   |

CODE_04BA56:
    LDA $5FA56E,x       ; $04BA56   |
    STA $7020C0,x       ; $04BA5A   |
    STA $7020E0,x       ; $04BA5E   |
    DEX                 ; $04BA62   |
    DEX                 ; $04BA63   |
    BNE CODE_04BA56     ; $04BA64   |
    LDX $12             ; $04BA66   |
    RTS                 ; $04BA68   |

DATA_04BA69:         dw $FF80
DATA_04BA6B:         dw $0080

; state 00
bigger_boo_moving:
    TYX                 ; $04BA6D   |
    LDY $18,x           ; $04BA6E   |
    CPY #$03            ; $04BA70   |
    BPL CODE_04BAA1     ; $04BA72   |
    LDA $7A96,x         ; $04BA74   |
    BNE CODE_04BAA1     ; $04BA77   |
    LDA #$0020          ; $04BA79   |
    STA $7A96,x         ; $04BA7C   |
    LDA $7A36,x         ; $04BA7F   |
    CMP $16,x           ; $04BA82   |
    BNE CODE_04BAA1     ; $04BA84   |
    LDY $77C2,x         ; $04BA86   |
    LDA $BA69,y         ; $04BA89   |
    STA $75E0,x         ; $04BA8C   |
    LDY $77C3,x         ; $04BA8F   |
    LDA $BA69,y         ; $04BA92   | table
    STA $75E2,x         ; $04BA95   |
    LDA #$0002          ; $04BA98   |
    STA $7540,x         ; $04BA9B   |
    STA $7542,x         ; $04BA9E   |

CODE_04BAA1:
    RTS                 ; $04BAA1   |

; state 01
bigger_boo_turning:
    TYX                 ; $04BAA2   |
    LDA $105C           ; $04BAA3   |
    SEC                 ; $04BAA6   |
    SBC #$FFF1          ; $04BAA7   |
    CMP #$0006          ; $04BAAA   |
    BCS CODE_04BAB3     ; $04BAAD   |
    LDY #$8008          ; $04BAAF   |
    PHP                 ; $04BAB2   |

CODE_04BAB3:
    LDA $7400,x         ; $04BAB3   |
    CLC                 ; $04BAB6   |
    ADC #$0004          ; $04BAB7   |
    TAY                 ; $04BABA   |
    STY $18,x           ; $04BABB   |
    LDY $79,x           ; $04BABD   |
    BNE CODE_04BAC3     ; $04BABF   |
    STY $76,x           ; $04BAC1   |

CODE_04BAC3:
    RTS                 ; $04BAC3   |

; state 02
bigger_boo_dead:
    TYX                 ; $04BAC4   |
    LDA $7A96,x         ; $04BAC5   |
    BNE CODE_04BAF4     ; $04BAC8   |
    LDA $7A36,x         ; $04BACA   |
    CMP $16,x           ; $04BACD   |
    BPL CODE_04BB1A     ; $04BACF   |
    CMP $105E           ; $04BAD1   |
    BNE CODE_04BAE5     ; $04BAD4   |
    CLC                 ; $04BAD6   |
    ADC #$0018          ; $04BAD7   |
    STA $105E           ; $04BADA   |
    LDA #$0020          ; $04BADD   |
    STA $7A96,x         ; $04BAE0   |
    BRA CODE_04BAF4     ; $04BAE3   |

CODE_04BAE5:
    CLC                 ; $04BAE5   |
    ADC #$0008          ; $04BAE6   |
    CMP #$0200          ; $04BAE9   |
    BMI CODE_04BAF1     ; $04BAEC   |
    LDA #$01FF          ; $04BAEE   |

CODE_04BAF1:
    STA $7A36,x         ; $04BAF1   |

CODE_04BAF4:
    JSR CODE_04BA0B     ; $04BAF4   |
    LDA $70336C         ; $04BAF7   |
    CMP #$0020          ; $04BAFB   |
    BPL CODE_04BB19     ; $04BAFE   |
    LDA #$2F6C          ; $04BB00   |
    STA $70336E         ; $04BB03   |
    LDA #$2D6C          ; $04BB07   |
    STA $703370         ; $04BB0A   |
    LDX #$08            ; $04BB0E   |
    LDA #$B4A9          ; $04BB10   |
    JSL $7EDE44         ; $04BB13   | GSU init
    LDX $12             ; $04BB17   |

CODE_04BB19:
    RTS                 ; $04BB19   |

CODE_04BB1A:
    LDA #$012E          ; $04BB1A   |
    JSL $03A34C         ; $04BB1D   |
    BCC CODE_04BB4D     ; $04BB21   |
    LDA $70E2,x         ; $04BB23   |
    STA $70E2,y         ; $04BB26   |
    LDA $7182,x         ; $04BB29   |
    STA $7182,y         ; $04BB2C   |
    LDA #$0002          ; $04BB2F   |
    STA $79D6,y         ; $04BB32   |
    LDA #$0081          ; $04BB35   |\ play sound #$0081
    JSL $0085D2         ; $04BB38   |/
    JSR CODE_04B601     ; $04BB3C   |
    LDA #$0040          ; $04BB3F   |
    STA $7A96,x         ; $04BB42   |
    LDA #$0050          ; $04BB45   |
    STA $61C6           ; $04BB48   |
    INC $76,x           ; $04BB4B   |

CODE_04BB4D:
    RTS                 ; $04BB4D   |

; bigger boo sub

CODE_04BB4E:
    LDX #$00            ; $04BB4E   |

CODE_04BB50:
    LDA $702F6A,x       ; $04BB50   |
    STA $701FFE,x       ; $04BB54   |
    DEX                 ; $04BB58   |
    DEX                 ; $04BB59   |
    BNE CODE_04BB50     ; $04BB5A   |
    LDX $12             ; $04BB5C   |
    LDA #$0000          ; $04BB5E   |
    STA $70336C         ; $04BB61   |
    LDY #$20            ; $04BB65   |
    STY $096C           ; $04BB67   |
    RTS                 ; $04BB6A   |

; state 03
bigger_boo_explode:
    TYX                 ; $04BB6B   |
    LDA $7A96,x         ; $04BB6C   |
    BNE CODE_04BB4D     ; $04BB6F   |
    LDA $70E2,x         ; $04BB71   |
    STA $00             ; $04BB74   |
    LDA $7182,x         ; $04BB76   |
    STA $02             ; $04BB79   |
    JSL $02E19C         ; $04BB7B   |
    LDA #$0100          ; $04BB7F   |
    STA $7A96,x         ; $04BB82   |
    PLA                 ; $04BB85   |
    JMP CODE_0403A3     ; $04BB86   |

    RTS                 ; $04BB8A   |

DATA_04BB8B:         dw $FF80
DATA_04BB8D:         dw $0080

; state 04
bigger_boo_intro_moving:
    TYX                 ; $04BB8F   |
    STZ $60C4           ; $04BB90   |
    LDA $7A98,x         ; $04BB93   |
    BNE CODE_04BBA1     ; $04BB96   |
    LDA #$0009          ; $04BB98   |
    STA $004D           ; $04BB9B   |
    DEC $7A98,x         ; $04BB9E   |

CODE_04BBA1:
    LDA $7C16,x         ; $04BBA1   |
    SEC                 ; $04BBA4   |
    SBC #$FFA0          ; $04BBA5   |
    BNE CODE_04BBB6     ; $04BBA8   |
    INC $7540,x         ; $04BBAA   |
    INC $1015           ; $04BBAD   |
    STZ $7A98,x         ; $04BBB0   |
    INC $76,x           ; $04BBB3   |
    RTS                 ; $04BBB5   |

CODE_04BBB6:
    STA $0C1E           ; $04BBB6   |
    LDA $0039           ; $04BBB9   |
    CMP #$0BC0          ; $04BBBC   |
    BEQ CODE_04BBDB     ; $04BBBF   |
    SEC                 ; $04BBC1   |
    SBC #$0BC0          ; $04BBC2   |
    STA $00             ; $04BBC5   |
    LDA $7974           ; $04BBC7   |
    AND #$0001          ; $04BBCA   |
    PHP                 ; $04BBCD   |
    LDA $0039           ; $04BBCE   |
    PLP                 ; $04BBD1   |
    BNE CODE_04BBDB     ; $04BBD2   |
    DEC A               ; $04BBD4   |
    LDY $01             ; $04BBD5   |
    BPL CODE_04BBDB     ; $04BBD7   |
    INC A               ; $04BBD9   |
    INC A               ; $04BBDA   |

CODE_04BBDB:
    STA $0C23           ; $04BBDB   |
    LDA $7C18,x         ; $04BBDE   |
    CMP #$8000          ; $04BBE1   |
    ROR A               ; $04BBE4   |
    CMP #$8000          ; $04BBE5   |
    ROR A               ; $04BBE8   |
    EOR #$FFFF          ; $04BBE9   |
    SEC                 ; $04BBEC   |
    ADC $7222,x         ; $04BBED   |
    STA $7222,x         ; $04BBF0   |

CODE_04BBF3:
    LDA $7A96,x         ; $04BBF3   |
    BNE CODE_04BC07     ; $04BBF6   |
    LDA #$0020          ; $04BBF8   |
    STA $7A96,x         ; $04BBFB   |
    LDY $77C3,x         ; $04BBFE   |
    LDA $BB8B,y         ; $04BC01   | table
    STA $75E2,x         ; $04BC04   |

CODE_04BC07:
    RTS                 ; $04BC07   |

; state 05
bigger_boo_intro_kamek:
    TYX                 ; $04BC08   |
    LDA $7220,x         ; $04BC09   |
    BPL CODE_04BC14     ; $04BC0C   |
    STZ $7220,x         ; $04BC0E   |
    STZ $7540,x         ; $04BC11   |

CODE_04BC14:
    LDA $1015           ; $04BC14   |
    BMI CODE_04BC3A     ; $04BC17   |
    CMP #$0002          ; $04BC19   |
    BMI CODE_04BBF3     ; $04BC1C   |
    STZ $75E2,x         ; $04BC1E   |
    LDA #$0002          ; $04BC21   |
    STA $7542,x         ; $04BC24   |
    LDA $7222,x         ; $04BC27   |
    CLC                 ; $04BC2A   |
    ADC #$0002          ; $04BC2B   |
    CMP #$0004          ; $04BC2E   |
    BCS CODE_04BC42     ; $04BC31   |
    STZ $7222,x         ; $04BC33   |
    STZ $7542,x         ; $04BC36   |
    RTS                 ; $04BC39   |

CODE_04BC3A:
    LDA #$0030          ; $04BC3A   |
    STA $7A96,x         ; $04BC3D   |
    INC $76,x           ; $04BC40   |

CODE_04BC42:
    RTS                 ; $04BC42   |

; state 06
bigger_boo_intro_darken:
    TYX                 ; $04BC43   |
    LDA $7A96,x         ; $04BC44   |
    BNE CODE_04BC42     ; $04BC47   |
    LDA $70336C         ; $04BC49   |
    CMP #$0011          ; $04BC4D   |
    BPL CODE_04BC6C     ; $04BC50   |
    LDA #$2D6C          ; $04BC52   |
    STA $70336E         ; $04BC55   |
    LDA #$2F6C          ; $04BC59   |
    STA $703370         ; $04BC5C   |
    LDX #$08            ; $04BC60   |
    LDA #$B4A9          ; $04BC62   |
    JSL $7EDE44         ; $04BC65   | GSU init
    LDX $12             ; $04BC69   |
    RTS                 ; $04BC6B   |

CODE_04BC6C:
    LDX #$1C            ; $04BC6C   |

CODE_04BC6E:
    LDA $5FE83E,x       ; $04BC6E   |
    STA $702E2C,x       ; $04BC72   |
    STA $7020C0,x       ; $04BC76   |
    LDA $5FE85A,x       ; $04BC7A   |
    STA $702E4C,x       ; $04BC7E   |
    STA $7020E0,x       ; $04BC82   |
    DEX                 ; $04BC86   |
    DEX                 ; $04BC87   |
    BNE CODE_04BC6E     ; $04BC88   |
    LDY #$0F            ; $04BC8A   |
    STY $4331           ; $04BC8C   |
    INY                 ; $04BC8F   |
    STY $4341           ; $04BC90   |
    LDA #$0512          ; $04BC93   |
    STA $0967           ; $04BC96   |
    LDY #$60            ; $04BC99   |
    STY $096C           ; $04BC9B   |
    LDX #$00            ; $04BC9E   |

CODE_04BCA0:
    LDA $701FFE,x       ; $04BCA0   |
    STA $702F6A,x       ; $04BCA4   |
    LDA $702D6A,x       ; $04BCA8   |
    STA $701FFE,x       ; $04BCAC   |
    DEX                 ; $04BCB0   |
    DEX                 ; $04BCB1   |
    BNE CODE_04BCA0     ; $04BCB2   |
    LDX $12             ; $04BCB4   |
    LDA #$4002          ; $04BCB6   |
    STA $7040,x         ; $04BCB9   |
    LDA #$0007          ; $04BCBC   |
    STA $74A2,x         ; $04BCBF   |
    SEP #$20            ; $04BCC2   |
    LDA #$22            ; $04BCC4   |
    STA $7042,x         ; $04BCC6   |
    STZ $7180,x         ; $04BCC9   |
    REP #$20            ; $04BCCC   |
    LDA #$0050          ; $04BCCE   |
    STA $16,x           ; $04BCD1   |
    LDA #$0040          ; $04BCD3   |
    STA $7A36,x         ; $04BCD6   |
    SEC                 ; $04BCD9   |
    SBC #$01C0          ; $04BCDA   |
    STA $3000           ; $04BCDD   |
    LDA #$FF90          ; $04BCE0   |
    STA $300C           ; $04BCE3   |
    LDX #$0B            ; $04BCE6   |
    LDA #$86B6          ; $04BCE8   |
    JSL $7EDE44         ; $04BCEB   | GSU init
    LDX $12             ; $04BCEF   |
    LDA #$0100          ; $04BCF1   |
    SEC                 ; $04BCF4   |
    SBC $3000           ; $04BCF5   |
    STA $02             ; $04BCF8   |
    STA $04             ; $04BCFA   |
    LDA $7722,x         ; $04BCFC   |
    STA $06             ; $04BCFF   |
    LDY $77,x           ; $04BD01   |
    TYA                 ; $04BD03   |
    STA $08             ; $04BD04   |
    LDY #$00            ; $04BD06   |
    JSR CODE_04B7CC     ; $04BD08   |
    LDA $08             ; $04BD0B   |
    STA $06             ; $04BD0D   |
    LDY #$02            ; $04BD0F   |
    JSR CODE_04B7CC     ; $04BD11   |
    LDX $12             ; $04BD14   |
    INC $0CF9           ; $04BD16   |
    LDA #$FFEC          ; $04BD19   |
    STA $105C           ; $04BD1C   |
    LDA $7182,x         ; $04BD1F   |
    SEC                 ; $04BD22   |
    SBC #$0004          ; $04BD23   |
    STA $7182,x         ; $04BD26   |
    LDA #$0002          ; $04BD29   |
    STA $18,x           ; $04BD2C   |
    LDY #$00            ; $04BD2E   |
    STY $78,x           ; $04BD30   |
    JSR CODE_04B601     ; $04BD32   |
    LDA #$0040          ; $04BD35   |
    STA $7A96,x         ; $04BD38   |
    STZ $1015           ; $04BD3B   |
    INC $76,x           ; $04BD3E   |
    RTS                 ; $04BD40   |

; state 07
bigger_boo_intro_growing:
    TYX                 ; $04BD41   |
    LDA $7A96,x         ; $04BD42   |
    BNE CODE_04BD82     ; $04BD45   |
    LDA $7A36,x         ; $04BD47   |
    CLC                 ; $04BD4A   |
    ADC #$0002          ; $04BD4B   |
    STA $7A36,x         ; $04BD4E   |
    CMP $16,x           ; $04BD51   |
    BMI CODE_04BD82     ; $04BD53   |
    LDA #$0020          ; $04BD55   |
    STA $7A96,x         ; $04BD58   |
    LDA $16,x           ; $04BD5B   |
    CLC                 ; $04BD5D   |
    ADC #$0010          ; $04BD5E   |
    CMP #$0090          ; $04BD61   |
    BNE CODE_04BD80     ; $04BD64   |
    STZ $60AC           ; $04BD66   |
    LDY #$00            ; $04BD69   |
    STY $76,x           ; $04BD6B   |
    STZ $7A96,x         ; $04BD6D   |
    STZ $0C1E           ; $04BD70   |
    STZ $1064           ; $04BD73   |
    LDA #$01DE          ; $04BD76   |
    JSL $039788         ; $04BD79   |
    LDA #$0080          ; $04BD7D   |

CODE_04BD80:
    STA $16,x           ; $04BD80   |

CODE_04BD82:
    RTS                 ; $04BD82   |

; bigger boo data pointers
DATA_04BD83:         dw $BD8D
DATA_04BD85:         dw $BF6F
DATA_04BD87:         dw $C060
DATA_04BD89:         dw $C151
DATA_04BD8B:         dw $BE7E

; bigger boo data tables
DATA_04BD8D:         dw $0678, $0610, $061A, $0622
DATA_04BD95:         dw $0628, $062E, $0632, $0636
DATA_04BD9D:         dw $063A, $063C, $0640, $0642
DATA_04BDA5:         dw $0646, $0648, $064A, $064E
DATA_04BDAD:         dw $0650, $0652, $0654, $0656
DATA_04BDB5:         dw $0658, $065A, $065A, $065C
DATA_04BDBD:         dw $025E, $0276, $027A, $017C
DATA_04BDC5:         dw $017D, $017D, $017D, $017D
DATA_04BDCD:         dw $017D, $027D, $027C, $017C
DATA_04BDD5:         dw $027B, $027A, $027A, $0278
DATA_04BDDD:         dw $0277, $0376, $0376, $0475
DATA_04BDE5:         dw $0474, $0573, $0673, $0672
DATA_04BDED:         dw $0672, $0672, $0672, $0674
DATA_04BDF5:         dw $0674, $0674, $0674, $0674
DATA_04BDFD:         dw $0674, $0674, $0674, $0574
DATA_04BE05:         dw $0575, $0575, $0575, $0575
DATA_04BE0D:         dw $0575, $0576, $0576, $0576
DATA_04BE15:         dw $0476, $0477, $0477, $0376
DATA_04BE1D:         dw $0377, $0377, $0378, $0278
DATA_04BE25:         dw $0178, $0179, $0179, $007A
DATA_04BE2D:         dw $FF7A, $FF7B, $FE7C, $FE7C
DATA_04BE35:         dw $FE7C, $FD7C, $FE7B, $FD7A
DATA_04BE3D:         dw $FD79, $FE77, $FD76, $FD75
DATA_04BE45:         dw $FE73, $FD72, $FD71, $FD6F
DATA_04BE4D:         dw $FE6D, $FE6C, $FE6A, $FE68
DATA_04BE55:         dw $FE66, $FE64, $FE62, $FE60
DATA_04BE5D:         dw $FE5E, $FE5B, $FE59, $FE56
DATA_04BE65:         dw $FE53, $FE51, $FF4D, $FF4A
DATA_04BE6D:         dw $FF46, $FF42, $FF3E, $FF3A
DATA_04BE75:         dw $FF35, $FF2F, $FF27, $FF1F
DATA_04BE7D:         db $13

DATA_04BE7E:         dw $0078, $0010, $001A, $0022
DATA_04BE86:         dw $0028, $002E, $0032, $0036
DATA_04BE8E:         dw $003A, $003C, $0040, $0042
DATA_04BE96:         dw $0046, $0048, $004A, $004E
DATA_04BE9E:         dw $0050, $0052, $0054, $0056
DATA_04BEA6:         dw $0058, $0058, $005A, $005C
DATA_04BEAE:         dw $005E, $005E, $0060, $0062
DATA_04BEB6:         dw $0062, $0064, $0066, $0066
DATA_04BEBE:         dw $0068, $0068, $006A, $006A
DATA_04BEC6:         dw $006C, $006C, $006C, $006E
DATA_04BECE:         dw $006E, $006E, $0070, $0070
DATA_04BED6:         dw $0070, $0070, $0072, $0072
DATA_04BEDE:         dw $0072, $0072, $0072, $0074
DATA_04BEE6:         dw $0074, $0074, $0074, $0074
DATA_04BEEE:         dw $0074, $0074, $0074, $0074
DATA_04BEF6:         dw $0074, $0074, $0074, $0074
DATA_04BEFE:         dw $0074, $0074, $0074, $0074
DATA_04BF06:         dw $0074, $0074, $0074, $0072
DATA_04BF0E:         dw $0072, $0072, $0072, $0072
DATA_04BF16:         dw $0070, $0070, $0070, $0070
DATA_04BF1E:         dw $006E, $006E, $006E, $006C
DATA_04BF26:         dw $006C, $006C, $006A, $006A
DATA_04BF2E:         dw $0068, $0068, $0066, $0066
DATA_04BF36:         dw $0064, $0062, $0062, $0060
DATA_04BF3E:         dw $005E, $005E, $005C, $005A
DATA_04BF46:         dw $0058, $0058, $0056, $0054
DATA_04BF4E:         dw $0052, $0050, $004E, $004A
DATA_04BF56:         dw $0048, $0046, $0042, $0040
DATA_04BF5E:         dw $003C, $003A, $0036, $0032
DATA_04BF66:         dw $002E, $0028, $0022, $001A
DATA_04BF6E:         db $10

DATA_04BF6F:         dw $FA78, $FA10, $FA1A, $FA22
DATA_04BF77:         dw $FA28, $FA2E, $FA32, $FA36
DATA_04BF7F:         dw $FA3A, $FA3C, $FA40, $FA42
DATA_04BF87:         dw $FA46, $FA48, $FA4A, $FA4E
DATA_04BF8F:         dw $FA50, $FA52, $FA54, $FA56
DATA_04BF97:         dw $FA58, $FA5A, $FA5A, $FA5C
DATA_04BF9F:         dw $FE5E, $FE76, $FE7A, $FE7C
DATA_04BFA7:         dw $FE7D, $FE7D, $FE7D, $FE7D
DATA_04BFAF:         dw $FE7D, $FE7D, $FE7C, $FE7C
DATA_04BFB7:         dw $FE7B, $FE7A, $FE7A, $FD78
DATA_04BFBF:         dw $FE77, $FD76, $FC76, $FC75
DATA_04BFC7:         dw $FB74, $FA73, $FA73, $FA72
DATA_04BFCF:         dw $FA72, $FA72, $FA72, $FA74
DATA_04BFD7:         dw $FA74, $FA74, $FA74, $FA74
DATA_04BFDF:         dw $FA74, $FA74, $FA74, $FA74
DATA_04BFE7:         dw $FA75, $FA75, $FA75, $FA75
DATA_04BFEF:         dw $FB75, $FB76, $FB76, $FB76
DATA_04BFF7:         dw $FB76, $FB77, $FC77, $FC76
DATA_04BFFF:         dw $FC77, $FD77, $FD78, $FE78
DATA_04C007:         dw $FE78, $FE79, $FF79, $007A
DATA_04C00F:         dw $007A, $017B, $027C, $027C
DATA_04C017:         dw $027C, $027C, $027B, $027A
DATA_04C01F:         dw $0279, $0277, $0276, $0275
DATA_04C027:         dw $0273, $0272, $0271, $026F
DATA_04C02F:         dw $026D, $026C, $026A, $0268
DATA_04C037:         dw $0266, $0264, $0262, $0260
DATA_04C03F:         dw $015E, $015B, $0259, $0156
DATA_04C047:         dw $0153, $0151, $014D, $014A
DATA_04C04F:         dw $0146, $0142, $013E, $003A
DATA_04C057:         dw $0035, $002F, $0027, $001F
DATA_04C05F:         db $13

DATA_04C060:         dw $0678, $0610, $061A, $0622
DATA_04C068:         dw $0628, $062E, $0632, $0636
DATA_04C070:         dw $063A, $063C, $0640, $0642
DATA_04C078:         dw $0646, $0648, $064A, $064E
DATA_04C080:         dw $0650, $0652, $0654, $0656
DATA_04C088:         dw $0658, $0658, $065A, $065C
DATA_04C090:         dw $065E, $065E, $0660, $0662
DATA_04C098:         dw $0662, $0664, $0666, $0666
DATA_04C0A0:         dw $0668, $0668, $066A, $066A
DATA_04C0A8:         dw $066C, $066C, $066C, $066E
DATA_04C0B0:         dw $066E, $066E, $0670, $0670
DATA_04C0B8:         dw $0670, $0670, $0672, $0672
DATA_04C0C0:         dw $0672, $0672, $0672, $0674
DATA_04C0C8:         dw $0674, $0674, $0674, $0674
DATA_04C0D0:         dw $0674, $0674, $0674, $0574
DATA_04C0D8:         dw $0575, $0575, $0575, $0575
DATA_04C0E0:         dw $0575, $0576, $0576, $0576
DATA_04C0E8:         dw $0476, $0477, $0477, $0376
DATA_04C0F0:         dw $0377, $0377, $0378, $0278
DATA_04C0F8:         dw $0178, $0179, $0179, $007A
DATA_04C100:         dw $FF7A, $FF7B, $FE7C, $FE7C
DATA_04C108:         dw $FE7C, $FD7C, $FE7B, $FD7A
DATA_04C110:         dw $FD79, $FE77, $FD76, $FD75
DATA_04C118:         dw $FE73, $FD72, $FD71, $FD6F
DATA_04C120:         dw $FE6D, $FE6C, $FE6A, $FE68
DATA_04C128:         dw $FE66, $FE64, $FE62, $FE60
DATA_04C130:         dw $FE5E, $FE5B, $FE59, $FE56
DATA_04C138:         dw $FE53, $FE51, $FF4D, $FF4A
DATA_04C140:         dw $FF46, $FF42, $FF3E, $FF3A
DATA_04C148:         dw $FF35, $FF2F, $FF27, $FF1F
DATA_04C150:         db $13

DATA_04C151:         dw $FA78, $FA10, $FA1A, $FA22
DATA_04C159:         dw $FA28, $FA2E, $FA32, $FA36
DATA_04C161:         dw $FA3A, $FA3C, $FA40, $FA42
DATA_04C169:         dw $FA46, $FA48, $FA4A, $FA4E
DATA_04C171:         dw $FA50, $FA52, $FA54, $FA56
DATA_04C179:         dw $FA58, $FA58, $FA5A, $FA5C
DATA_04C181:         dw $FA5E, $FA5E, $FA60, $FA62
DATA_04C189:         dw $FA62, $FA64, $FA66, $FA66
DATA_04C191:         dw $FA68, $FA68, $FA6A, $FA6A
DATA_04C199:         dw $FA6C, $FA6C, $FA6C, $FA6E
DATA_04C1A1:         dw $FA6E, $FA6E, $FA70, $FA70
DATA_04C1A9:         dw $FA70, $FA70, $FA72, $FA72
DATA_04C1B1:         dw $FA72, $FA72, $FA72, $FA74
DATA_04C1B9:         dw $FA74, $FA74, $FA74, $FA74
DATA_04C1C1:         dw $FA74, $FA74, $FA74, $FA74
DATA_04C1C9:         dw $FA75, $FA75, $FA75, $FA75
DATA_04C1D1:         dw $FB75, $FB76, $FB76, $FB76
DATA_04C1D9:         dw $FB76, $FB77, $FC77, $FC76
DATA_04C1E1:         dw $FC77, $FD77, $FD78, $FE78
DATA_04C1E9:         dw $FE78, $FE79, $FF79, $007A
DATA_04C1F1:         dw $007A, $017B, $027C, $027C
DATA_04C1F9:         dw $027C, $027C, $027B, $027A
DATA_04C201:         dw $0279, $0277, $0276, $0275
DATA_04C209:         dw $0273, $0272, $0271, $026F
DATA_04C211:         dw $026D, $026C, $026A, $0268
DATA_04C219:         dw $0266, $0264, $0262, $0260
DATA_04C221:         dw $015E, $015B, $0259, $0156
DATA_04C229:         dw $0153, $0151, $014D, $014A
DATA_04C231:         dw $0146, $0142, $013E, $003A
DATA_04C239:         dw $0035, $002F, $0027, $001F
DATA_04C241:         db $13

DATA_04C242:         db $80, $7F

.init_pink_pinwheel_with_shyguys
    LDA $7974           ; $04C244   |
    STA $0FF9           ; $04C247   |
    LDY #$94F0          ; $04C24A   |
    ADC $00A0,y         ; $04C24D   |
    JSR CODE_04C433     ; $04C250   |
    LDA #$0004          ; $04C253   |
    STA $00             ; $04C256   |

CODE_04C258:
    LDA $00             ; $04C258   |
    ASL A               ; $04C25A   |
    TAY                 ; $04C25B   |
    LDA $0FF9,y         ; $04C25C   |
    STA $04             ; $04C25F   |
    LDA $1001,y         ; $04C261   |
    STA $06             ; $04C264   |
    LDA #$001E          ; $04C266   |
    JSL $03A364         ; $04C269   |
    BCC CODE_04C2A7     ; $04C26D   |
    LDA $04             ; $04C26F   |
    STA $7A36,y         ; $04C271   |
    SEC                 ; $04C274   |
    SBC #$0008          ; $04C275   |
    STA $70E2,y         ; $04C278   |
    LDA $06             ; $04C27B   |
    STA $7A38,y         ; $04C27D   |
    SEC                 ; $04C280   |
    SBC #$0010          ; $04C281   |
    STA $7182,y         ; $04C284   |
    LDA $00             ; $04C287   |
    ASL A               ; $04C289   |
    STA $79D8,y         ; $04C28A   |
    TXA                 ; $04C28D   |
    STA $7978,y         ; $04C28E   |
    LDA $0FF9           ; $04C291   |
    STA $7900,y         ; $04C294   |
    LDA #$0001          ; $04C297   |
    STA $7902,y         ; $04C29A   |
    LDA #$0004          ; $04C29D   |
    STA $79D6,y         ; $04C2A0   |
    DEC $00             ; $04C2A3   |
    BNE CODE_04C258     ; $04C2A5   |

.init_pink_pinwheel

CODE_04C2A7:
    LDA $70E2,x         ; $04C2A7   |
    AND #$0010          ; $04C2AA   |
    LSR A               ; $04C2AD   |
    LSR A               ; $04C2AE   |
    LSR A               ; $04C2AF   |
    LSR A               ; $04C2B0   |
    TAY                 ; $04C2B1   |
    LDA $C242,y         ; $04C2B2   |
    TAY                 ; $04C2B5   |
    STY $19,x           ; $04C2B6   |

.init_pinwheel 								 ; green and pink pinwheels
    STZ $7400,x         ; $04C2B8   |
    SEP #$20            ; $04C2BB   |
    LDA #$FF            ; $04C2BD   |
    STA $7863,x         ; $04C2BF   |
    REP #$20            ; $04C2C2   |
    LDA #$8000          ; $04C2C4   |
    STA $75E0,x         ; $04C2C7   |
    XBA                 ; $04C2CA   |
    STA $7900,x         ; $04C2CB   |
    LDY #$F0            ; $04C2CE   |
    STY $79,x           ; $04C2D0   |
    STZ $7BB6,x         ; $04C2D2   |
    STZ $7BB8,x         ; $04C2D5   |
    LDA $7182,x         ; $04C2D8   |
    SEC                 ; $04C2DB   |
    SBC #$0008          ; $04C2DC   |
    STA $7182,x         ; $04C2DF   |
    LDA $0136           ; $04C2E2   |
    CMP #$0003          ; $04C2E5   |
    BEQ CODE_04C2EF     ; $04C2E8   |
    CMP #$000D          ; $04C2EA   |
    BNE CODE_04C2F5     ; $04C2ED   |

CODE_04C2EF:
    INC $7B58,x         ; $04C2EF   |
    INC $7B58,x         ; $04C2F2   |

CODE_04C2F5:
    RTL                 ; $04C2F5   |

.main_pinwheel                               ; all of them
    STZ $04             ; $04C2F6   |
    LDA $7360,x         ; $04C2F8   |
    CMP #$0056          ; $04C2FB   |
    BEQ CODE_04C30D     ; $04C2FE   |
    CMP #$0064          ; $04C300   |
    BNE CODE_04C311     ; $04C303   |
    LDA $7182,x         ; $04C305   |
    AND #$0010          ; $04C308   |
    BNE CODE_04C311     ; $04C30B   |

CODE_04C30D:
    INC $04             ; $04C30D   |
    INC $04             ; $04C30F   |

CODE_04C311:
    JSR CODE_04C332     ; $04C311   |
    JSL $03AF23         ; $04C314   |
    LDA $7362,x         ; $04C318   |
    BMI CODE_04C331     ; $04C31B   |
    LDY $74A2,x         ; $04C31D   |
    BMI CODE_04C331     ; $04C320   |
    JSR CODE_04C530     ; $04C322   |
    JSR CODE_04C776     ; $04C325   |
    JSR CODE_04C574     ; $04C328   |
    JSR CODE_04C66A     ; $04C32B   |
    JSR CODE_04C7F4     ; $04C32E   |

CODE_04C331:
    RTL                 ; $04C331   |

CODE_04C332:
    LDA $7362,x         ; $04C332   |
    BMI CODE_04C33C     ; $04C335   |
    LDY $74A2,x         ; $04C337   |
    BPL CODE_04C33D     ; $04C33A   |

CODE_04C33C:
    RTS                 ; $04C33C   |

CODE_04C33D:
    LDY $04             ; $04C33D   |
    JSR CODE_04C433     ; $04C33F   |
    LDA $300E           ; $04C342   |
    STA $0C             ; $04C345   |
    LDA $3010           ; $04C347   |
    STA $0E             ; $04C34A   |
    LDA $7680,x         ; $04C34C   |
    CLC                 ; $04C34F   |
    ADC #$0008          ; $04C350   |
    STA $08             ; $04C353   |
    LDA $7682,x         ; $04C355   |
    STA $0A             ; $04C358   |
    REP #$10            ; $04C35A   |
    LDY $7362,x         ; $04C35C   |
    LDA $08             ; $04C35F   |
    CLC                 ; $04C361   |
    ADC $3010           ; $04C362   |
    SEC                 ; $04C365   |
    SBC $00             ; $04C366   |
    STA $6000,y         ; $04C368   |
    CLC                 ; $04C36B   |
    ADC $02             ; $04C36C   |
    STA $6008,y         ; $04C36E   |
    LDA $08             ; $04C371   |
    CLC                 ; $04C373   |
    ADC $300E           ; $04C374   |
    SEC                 ; $04C377   |
    SBC $00             ; $04C378   |
    STA $6010,y         ; $04C37A   |
    CLC                 ; $04C37D   |
    ADC $02             ; $04C37E   |
    STA $6018,y         ; $04C380   |
    LDA $08             ; $04C383   |
    SEC                 ; $04C385   |
    SBC $3010           ; $04C386   |
    SEC                 ; $04C389   |
    SBC $00             ; $04C38A   |
    STA $6020,y         ; $04C38C   |
    CLC                 ; $04C38F   |
    ADC $02             ; $04C390   |
    STA $6028,y         ; $04C392   |
    LDA $08             ; $04C395   |
    SEC                 ; $04C397   |
    SBC $300E           ; $04C398   |
    SEC                 ; $04C39B   |
    SBC $00             ; $04C39C   |
    STA $6030,y         ; $04C39E   |
    CLC                 ; $04C3A1   |
    ADC $02             ; $04C3A2   |
    STA $6038,y         ; $04C3A4   |
    LDA $0A             ; $04C3A7   |
    SEC                 ; $04C3A9   |
    SBC $300E           ; $04C3AA   |
    STA $6002,y         ; $04C3AD   |
    STA $600A,y         ; $04C3B0   |
    LDA $0A             ; $04C3B3   |
    CLC                 ; $04C3B5   |
    ADC $3010           ; $04C3B6   |
    STA $6012,y         ; $04C3B9   |
    STA $601A,y         ; $04C3BC   |
    LDA $0A             ; $04C3BF   |
    CLC                 ; $04C3C1   |
    ADC $300E           ; $04C3C2   |
    STA $6022,y         ; $04C3C5   |
    STA $602A,y         ; $04C3C8   |
    LDA $0A             ; $04C3CB   |
    SEC                 ; $04C3CD   |
    SBC $3010           ; $04C3CE   |
    STA $6032,y         ; $04C3D1   |
    STA $603A,y         ; $04C3D4   |
    JSR CODE_04C4C7     ; $04C3D7   |
    LDA $04             ; $04C3DA   |
    BEQ CODE_04C40B     ; $04C3DC   |
    LDA $6004,y         ; $04C3DE   |
    AND #$F1FF          ; $04C3E1   |
    ORA #$0800          ; $04C3E4   |
    STA $6004,y         ; $04C3E7   |
    STA $6014,y         ; $04C3EA   |
    STA $6024,y         ; $04C3ED   |
    STA $6034,y         ; $04C3F0   |
    LDA $600C,y         ; $04C3F3   |
    AND #$F1FF          ; $04C3F6   |
    ORA #$0800          ; $04C3F9   |
    STA $600C,y         ; $04C3FC   |
    STA $601C,y         ; $04C3FF   |
    STA $602C,y         ; $04C402   |
    STA $603C,y         ; $04C405   |
    SEP #$10            ; $04C408   |
    RTS                 ; $04C40A   |

CODE_04C40B:
    LDA $3012           ; $04C40B   |
    CLC                 ; $04C40E   |
    ADC $3012           ; $04C40F   |
    STA $3012           ; $04C412   |
    LDA $3014           ; $04C415   |
    CLC                 ; $04C418   |
    ADC $3014           ; $04C419   |
    STA $3014           ; $04C41C   |
    TYA                 ; $04C41F   |
    CLC                 ; $04C420   |
    ADC #$0020          ; $04C421   |
    TAY                 ; $04C424   |
    JSR CODE_04C4C7     ; $04C425   |
    SEP #$10            ; $04C428   |
    RTS                 ; $04C42A   |

DATA_04C42B:         db $10, $10, $0C, $08, $28, $00, $18, $00

CODE_04C433:
    LDA $C42B,y         ; $04C433   |
    AND #$00FF          ; $04C436   |
    STA $00             ; $04C439   |
    LDA $C42C,y         ; $04C43B   |
    AND #$00FF          ; $04C43E   |
    STA $02             ; $04C441   |
    LDA $C42F,y         ; $04C443   |
    STA $300C           ; $04C446   |
    LDA #$0003          ; $04C449   |
    STA $3012           ; $04C44C   |
    CPY #$00            ; $04C44F   |
    BEQ CODE_04C456     ; $04C451   |
    DEC $3012           ; $04C453   |

CODE_04C456:
    LDY $79,x           ; $04C456   |
    TYA                 ; $04C458   |
    ASL A               ; $04C459   |
    STA $3002           ; $04C45A   |
    LDX #$0B            ; $04C45D   |
    LDA #$85D0          ; $04C45F   |
    JSL $7EDE44         ; $04C462   | GSU init
    LDX $12             ; $04C466   |
    LDA $7360,x         ; $04C468   |
    CMP #$015E          ; $04C46B   |
    BNE CODE_04C4C6     ; $04C46E   |
    LDA $70E2,x         ; $04C470   |
    CLC                 ; $04C473   |
    ADC #$0008          ; $04C474   |
    STA $06             ; $04C477   |
    LDA $7182,x         ; $04C479   |
    STA $08             ; $04C47C   |
    LDA $06             ; $04C47E   |
    CLC                 ; $04C480   |
    ADC $3010           ; $04C481   |
    STA $0FFB           ; $04C484   |
    LDA $06             ; $04C487   |
    CLC                 ; $04C489   |
    ADC $300E           ; $04C48A   |
    STA $0FFD           ; $04C48D   |
    LDA $06             ; $04C490   |
    SEC                 ; $04C492   |
    SBC $3010           ; $04C493   |
    STA $0FFF           ; $04C496   |
    LDA $06             ; $04C499   |
    SEC                 ; $04C49B   |
    SBC $300E           ; $04C49C   |
    STA $1001           ; $04C49F   |
    LDA $08             ; $04C4A2   |
    SEC                 ; $04C4A4   |
    SBC $300E           ; $04C4A5   |
    STA $1003           ; $04C4A8   |
    LDA $08             ; $04C4AB   |
    CLC                 ; $04C4AD   |
    ADC $3010           ; $04C4AE   |
    STA $1005           ; $04C4B1   |
    LDA $08             ; $04C4B4   |
    CLC                 ; $04C4B6   |
    ADC $300E           ; $04C4B7   |
    STA $1007           ; $04C4BA   |
    LDA $08             ; $04C4BD   |
    SEC                 ; $04C4BF   |
    SBC $3010           ; $04C4C0   |
    STA $1009           ; $04C4C3   |

CODE_04C4C6:
    RTS                 ; $04C4C6   |

CODE_04C4C7:
    LDA $08             ; $04C4C7   |
    CLC                 ; $04C4C9   |
    ADC $3014           ; $04C4CA   |
    SEC                 ; $04C4CD   |
    SBC #$0004          ; $04C4CE   |
    STA $6048,y         ; $04C4D1   |
    LDA $08             ; $04C4D4   |
    CLC                 ; $04C4D6   |
    ADC $3012           ; $04C4D7   |
    SEC                 ; $04C4DA   |
    SBC #$0004          ; $04C4DB   |
    STA $6050,y         ; $04C4DE   |
    LDA $08             ; $04C4E1   |
    SEC                 ; $04C4E3   |
    SBC $3014           ; $04C4E4   |
    SEC                 ; $04C4E7   |
    SBC #$0004          ; $04C4E8   |
    STA $6058,y         ; $04C4EB   |
    LDA $08             ; $04C4EE   |
    SEC                 ; $04C4F0   |
    SBC $3012           ; $04C4F1   |
    SEC                 ; $04C4F4   |
    SBC #$0004          ; $04C4F5   |
    STA $6060,y         ; $04C4F8   |
    LDA $0A             ; $04C4FB   |
    SEC                 ; $04C4FD   |
    SBC $3012           ; $04C4FE   |
    CLC                 ; $04C501   |
    ADC #$0004          ; $04C502   |
    STA $604A,y         ; $04C505   |
    LDA $0A             ; $04C508   |
    CLC                 ; $04C50A   |
    ADC $3014           ; $04C50B   |
    CLC                 ; $04C50E   |
    ADC #$0004          ; $04C50F   |
    STA $6052,y         ; $04C512   |
    LDA $0A             ; $04C515   |
    CLC                 ; $04C517   |
    ADC $3012           ; $04C518   |
    CLC                 ; $04C51B   |
    ADC #$0004          ; $04C51C   |
    STA $605A,y         ; $04C51F   |
    LDA $0A             ; $04C522   |
    SEC                 ; $04C524   |
    SBC $3014           ; $04C525   |
    CLC                 ; $04C528   |
    ADC #$0004          ; $04C529   |
    STA $6062,y         ; $04C52C   |
    RTS                 ; $04C52F   |

CODE_04C530:
    LDA $75E0,x         ; $04C530   |
    CMP #$8000          ; $04C533   |
    BNE CODE_04C56B     ; $04C536   |
    STZ $75E0,x         ; $04C538   |
    LDA $7360,x         ; $04C53B   |
    CMP #$0064          ; $04C53E   |
    BEQ CODE_04C562     ; $04C541   |
    CMP #$015E          ; $04C543   |
    BEQ CODE_04C562     ; $04C546   |
    REP #$10            ; $04C548   |
    LDA $7902,x         ; $04C54A   |
    TAX                 ; $04C54D   |
    LDA $700006,x       ; $04C54E   |
    SEP #$10            ; $04C552   |
    LDX $12             ; $04C554   |
    AND #$FF00          ; $04C556   |
    CMP #$8700          ; $04C559   |
    BNE CODE_04C562     ; $04C55C   |
    INC $77,x           ; $04C55E   |
    BRA CODE_04C56B     ; $04C560   |

CODE_04C562:
    LDA $6FA2,x         ; $04C562   |
    AND #$FFE0          ; $04C565   |
    STA $6FA2,x         ; $04C568   |

CODE_04C56B:
    RTS                 ; $04C56B   |

DATA_04C56C:         dw $0010, $000C

DATA_04C570:         dw $6B6A, $6B6C

CODE_04C574:
    LDY $77,x           ; $04C574   |
    BNE CODE_04C5B9     ; $04C576   |
    LDY $04             ; $04C578   |
    LDA $C56C,y         ; $04C57A   |
    STA $6028           ; $04C57D   |

    LDA $7CD6,x         ; $04C580   |
    STA $602A           ; $04C583   |
    LDA $7CD8,x         ; $04C586   |
    STA $602C           ; $04C589   |
    LDA $78,x           ; $04C58C   |
    STA $300C           ; $04C58E   |
    LDA $19,x           ; $04C591   |
    STA $300A           ; $04C593   |
    LDA $0C             ; $04C596   |
    STA $603C           ; $04C598   |
    LDA $0E             ; $04C59B   |
    STA $603E           ; $04C59D   |
    LDX #$0A            ; $04C5A0   |
    LDA #$E864          ; $04C5A2   |
    JSL $7EDE91         ; $04C5A5   | GSU init
    LDX $12             ; $04C5A9   |
    LDA $3002           ; $04C5AB   |
    STA $7860,x         ; $04C5AE   |
    BEQ CODE_04C60D     ; $04C5B1   |
    LDY #$00            ; $04C5B3   |
    STY $19,x           ; $04C5B5   |
    BRA CODE_04C60D     ; $04C5B7   |

CODE_04C5B9:
    LDA $16,x           ; $04C5B9   |
    SEC                 ; $04C5BB   |
    SBC #$4000          ; $04C5BC   |
    EOR $18,x           ; $04C5BF   |
    BMI CODE_04C5E5     ; $04C5C1   |
    LDA $16,x           ; $04C5C3   |
    CLC                 ; $04C5C5   |
    ADC #$8000          ; $04C5C6   |
    STA $16,x           ; $04C5C9   |
    LDA $75E0,x         ; $04C5CB   |
    LDY $7900,x         ; $04C5CE   |
    CPY #$02            ; $04C5D1   |
    BPL CODE_04C5DE     ; $04C5D3   |
    CLC                 ; $04C5D5   |
    ADC #$0100          ; $04C5D6   |
    AND #$01FE          ; $04C5D9   |
    BRA CODE_04C5E2     ; $04C5DC   |

CODE_04C5DE:
    EOR #$FFFF          ; $04C5DE   |
    INC A               ; $04C5E1   |

CODE_04C5E2:
    STA $75E0,x         ; $04C5E2   |

CODE_04C5E5:
    LDA $70E2,x         ; $04C5E5   |
    STA $00             ; $04C5E8   |
    LDA $7182,x         ; $04C5EA   |
    STA $02             ; $04C5ED   |
    JSL $04A9FD         ; $04C5EF   |
    LDA $70E2,x         ; $04C5F3   |
    SEC                 ; $04C5F6   |
    SBC $00             ; $04C5F7   |
    CLC                 ; $04C5F9   |
    ADC $72C0,x         ; $04C5FA   |
    STA $72C0,x         ; $04C5FD   |
    LDA $7182,x         ; $04C600   |
    SEC                 ; $04C603   |
    SBC $02             ; $04C604   |
    CLC                 ; $04C606   |
    ADC $72C2,x         ; $04C607   |
    STA $72C2,x         ; $04C60A   |

CODE_04C60D:
    LDY $19,x           ; $04C60D   |
    TYA                 ; $04C60F   |
    CPY #$00            ; $04C610   |
    BPL CODE_04C617     ; $04C612   |
    ORA #$FF00          ; $04C614   |

CODE_04C617:
    STA $00             ; $04C617   |
    ASL A               ; $04C619   |
    CLC                 ; $04C61A   |
    ADC $78,x           ; $04C61B   |
    STA $78,x           ; $04C61D   |
    LDA $7360,x         ; $04C61F   |
    CMP #$0064          ; $04C622   |
    BEQ CODE_04C65B     ; $04C625   |
    CMP #$015E          ; $04C627   |
    BEQ CODE_04C65B     ; $04C62A   |
    LDA $00             ; $04C62C   |
    BPL CODE_04C634     ; $04C62E   |
    EOR #$FFFF          ; $04C630   |
    INC A               ; $04C633   |

CODE_04C634:
    CLC                 ; $04C634   |
    ADC $7BB6,x         ; $04C635   |
    CMP #$0600          ; $04C638   |
    BMI CODE_04C657     ; $04C63B   |
    PHA                 ; $04C63D   |
    LDA $7BB8,x         ; $04C63E   |
    INC A               ; $04C641   |
    AND #$0003          ; $04C642   |
    STA $7BB8,x         ; $04C645   |
    TAY                 ; $04C648   |
    LDA $C570,y         ; $04C649   |
    TAY                 ; $04C64C   |
    TYA                 ; $04C64D   |
    JSL $0085D2         ; $04C64E   |
    PLA                 ; $04C652   |
    SEC                 ; $04C653   |
    SBC #$0600          ; $04C654   |

CODE_04C657:
    STA $7BB6,x         ; $04C657   |
    RTS                 ; $04C65A   |

CODE_04C65B:
    LDY $19,x           ; $04C65B   |
    BEQ CODE_04C665     ; $04C65D   |
    LDA #$00E0          ; $04C65F   |
    STA $0051           ; $04C662   |

CODE_04C665:
    RTS                 ; $04C665   |

DATA_04C666:         dw $0014, $0010

CODE_04C66A:
    LDY $04             ; $04C66A   |
    LDA $C666,y         ; $04C66C   |
    STA $3000           ; $04C66F   |
    ASL A               ; $04C672   |
    STA $3002           ; $04C673   |
    LDA $0C             ; $04C676   |
    EOR #$FFFF          ; $04C678   |
    INC A               ; $04C67B   |
    STA $08             ; $04C67C   |
    LDA $0E             ; $04C67E   |
    EOR #$FFFF          ; $04C680   |
    INC A               ; $04C683   |
    STA $0A             ; $04C684   |
    STZ $06             ; $04C686   |
    LDA $0C             ; $04C688   |
    STA $00             ; $04C68A   |
    LDA $0E             ; $04C68C   |
    JSR CODE_04C6B3     ; $04C68E   |
    INC $06             ; $04C691   |
    LDA $0E             ; $04C693   |
    STA $00             ; $04C695   |
    LDA $08             ; $04C697   |
    JSR CODE_04C6B3     ; $04C699   |
    INC $06             ; $04C69C   |
    LDA $08             ; $04C69E   |
    STA $00             ; $04C6A0   |
    LDA $0A             ; $04C6A2   |
    JSR CODE_04C6B3     ; $04C6A4   |
    INC $06             ; $04C6A7   |
    LDA $0A             ; $04C6A9   |
    STA $00             ; $04C6AB   |
    LDA $0C             ; $04C6AD   |
    JSR CODE_04C6B3     ; $04C6AF   |
    RTS                 ; $04C6B2   |

CODE_04C6B3:
    STA $02             ; $04C6B3   |
    CPX $61B6           ; $04C6B5   |
    BEQ CODE_04C6F9     ; $04C6B8   |
    LDY $60AB           ; $04C6BA   |
    BMI CODE_04C6F8     ; $04C6BD   |
    LDA $7C16,x         ; $04C6BF   |
    CLC                 ; $04C6C2   |
    ADC $00             ; $04C6C3   |
    CLC                 ; $04C6C5   |
    ADC $3000           ; $04C6C6   |
    CMP $3002           ; $04C6C9   |
    BCS CODE_04C6F8     ; $04C6CC   |
    LDA $7C18,x         ; $04C6CE   |
    CLC                 ; $04C6D1   |
    ADC $02             ; $04C6D2   |
    SEC                 ; $04C6D4   |
    SBC $6122           ; $04C6D5   |
    SEC                 ; $04C6D8   |
    SBC #$0008          ; $04C6D9   |
    CMP #$FFF6          ; $04C6DC   |
    BCC CODE_04C6F8     ; $04C6DF   |
    LDY $61B6           ; $04C6E1   |
    BNE CODE_04C6F8     ; $04C6E4   |
    STX $61B6           ; $04C6E6   |
    SEC                 ; $04C6E9   |
    ADC $6090           ; $04C6EA   |
    INC A               ; $04C6ED   |
    STA $6090           ; $04C6EE   |
    LDY $06             ; $04C6F1   |
    STY $18,x           ; $04C6F3   |
    JMP CODE_04C766     ; $04C6F5   |

CODE_04C6F8:
    RTS                 ; $04C6F8   |

CODE_04C6F9:
    LDY $18,x           ; $04C6F9   |
    CPY $06             ; $04C6FB   |
    BNE CODE_04C6F8     ; $04C6FD   |
    LDY $60AB           ; $04C6FF   |
    BMI CODE_04C758     ; $04C702   |
    LDY $0D94           ; $04C704   |
    BNE CODE_04C758     ; $04C707   |
    LDY $76,x           ; $04C709   |
    TYA                 ; $04C70B   |
    CPY #$00            ; $04C70C   |
    BPL CODE_04C713     ; $04C70E   |
    ORA #$FF00          ; $04C710   |

CODE_04C713:
    STA $3004           ; $04C713   |
    LDA $00             ; $04C716   |
    SEC                 ; $04C718   |
    SBC $3004           ; $04C719   |
    CLC                 ; $04C71C   |
    ADC $72C0,x         ; $04C71D   |
    STA $3004           ; $04C720   |
    CLC                 ; $04C723   |
    ADC $608C           ; $04C724   |
    STA $608C           ; $04C727   |
    LDA $3004           ; $04C72A   |
    CLC                 ; $04C72D   |
    ADC $7C16,x         ; $04C72E   |
    STA $7C16,x         ; $04C731   |
    LDA $7C18,x         ; $04C734   |
    CLC                 ; $04C737   |
    ADC $02             ; $04C738   |
    SEC                 ; $04C73A   |
    SBC $6122           ; $04C73B   |
    SEC                 ; $04C73E   |
    SBC #$0008          ; $04C73F   |
    SEC                 ; $04C742   |
    ADC $6090           ; $04C743   |
    STA $6090           ; $04C746   |
    LDA $7C16,x         ; $04C749   |
    CLC                 ; $04C74C   |
    ADC $00             ; $04C74D   |
    CLC                 ; $04C74F   |
    ADC $3000           ; $04C750   |
    CMP $3002           ; $04C753   |
    BCC CODE_04C766     ; $04C756   |

CODE_04C758:
    CPX $61B6           ; $04C758   |
    BNE CODE_04C760     ; $04C75B   |
    STZ $61B6           ; $04C75D   |

CODE_04C760:
    LDY #$00            ; $04C760   |
    STY $18,x           ; $04C762   |
    PLA                 ; $04C764   |
    RTS                 ; $04C765   |

CODE_04C766:
    INC $61B4           ; $04C766   |
    LDY $00             ; $04C769   |
    STY $76,x           ; $04C76B   |
    STZ $60AA           ; $04C76D   |
    PLA                 ; $04C770   |

CODE_04C771:
    RTS                 ; $04C771   |

DATA_04C772:         db $00, $40, $80, $C0

CODE_04C776:
    LDA $7360,x         ; $04C776   |
    CMP #$0064          ; $04C779   |
    BEQ CODE_04C771     ; $04C77C   |
    CMP #$015E          ; $04C77E   |
    BEQ CODE_04C771     ; $04C781   |
    CPX $61B6           ; $04C783   |
    BNE CODE_04C7D1     ; $04C786   |
    LDY $18,x           ; $04C788   |
    LDA $C772,y         ; $04C78A   |
    AND #$00FF          ; $04C78D   |
    CLC                 ; $04C790   |
    ADC $79,x           ; $04C791   |
    AND #$00FF          ; $04C793   |
    ASL A               ; $04C796   |
    STA $3002           ; $04C797   |
    LDA #$FFF0          ; $04C79A   |
    STA $300C           ; $04C79D   |
    LDX #$0B            ; $04C7A0   |
    LDA #$8595          ; $04C7A2   |
    JSL $7EDE44         ; $04C7A5   | GSU init
    LDX $12             ; $04C7A9   |
    LDA $3000           ; $04C7AB   |
    INC A               ; $04C7AE   |
    CMP #$0002          ; $04C7AF   |
    BCC CODE_04C7D1     ; $04C7B2   |
    LDY $19,x           ; $04C7B4   |
    TYA                 ; $04C7B6   |
    CPY #$00            ; $04C7B7   |
    BPL CODE_04C7BE     ; $04C7B9   |
    ORA #$FF00          ; $04C7BB   |

CODE_04C7BE:
    CLC                 ; $04C7BE   |
    ADC $3000           ; $04C7BF   |
    TAY                 ; $04C7C2   |
    CLC                 ; $04C7C3   |
    ADC #$0080          ; $04C7C4   |
    CMP #$0100          ; $04C7C7   |
    BCC CODE_04C7CE     ; $04C7CA   |
    LDY $19,x           ; $04C7CC   |

CODE_04C7CE:
    STY $19,x           ; $04C7CE   |
    RTS                 ; $04C7D0   |

CODE_04C7D1:
    LDY $19,x           ; $04C7D1   |
    TYA                 ; $04C7D3   |
    CPY #$00            ; $04C7D4   |
    BPL CODE_04C7E1     ; $04C7D6   |
    ORA #$FF00          ; $04C7D8   |
    CLC                 ; $04C7DB   |
    ADC #$0002          ; $04C7DC   |
    BRA CODE_04C7E5     ; $04C7DF   |

CODE_04C7E1:
    SEC                 ; $04C7E1   |
    SBC #$0002          ; $04C7E2   |

CODE_04C7E5:
    TAY                 ; $04C7E5   |
    CLC                 ; $04C7E6   |
    ADC #$0002          ; $04C7E7   |
    CMP #$0004          ; $04C7EA   |
    BCS CODE_04C7F1     ; $04C7ED   |
    LDY #$00            ; $04C7EF   |

CODE_04C7F1:
    STY $19,x           ; $04C7F1   |
    RTS                 ; $04C7F3   |

CODE_04C7F4:
    SEP #$20            ; $04C7F4   |
    LDA $19,x           ; $04C7F6   |
    PHP                 ; $04C7F8   |
    BPL CODE_04C7FE     ; $04C7F9   |
    EOR #$FF            ; $04C7FB   |
    INC A               ; $04C7FD   |

CODE_04C7FE:
    TAY                 ; $04C7FE   |
    REP #$20            ; $04C7FF   |
    TYA                 ; $04C801   |
    STA $7A37,x         ; $04C802   |
    SEP #$20            ; $04C805   |
    STZ $7A39,x         ; $04C807   |
    PLP                 ; $04C80A   |
    BPL CODE_04C810     ; $04C80B   |
    DEC $7A39,x         ; $04C80D   |

CODE_04C810:
    REP #$20            ; $04C810   |
    LDY $77,x           ; $04C812   |
    BNE CODE_04C832     ; $04C814   |
    LDA $7360,x         ; $04C816   |
    CMP #$0064          ; $04C819   |
    BEQ CODE_04C832     ; $04C81C   |
    CMP #$015E          ; $04C81E   |
    BEQ CODE_04C832     ; $04C821   |
    LDA $7A37,x         ; $04C823   |
    LDY $7A39,x         ; $04C826   |
    BNE CODE_04C82F     ; $04C829   |
    EOR #$FFFF          ; $04C82B   |
    INC A               ; $04C82E   |

CODE_04C82F:
    STA $7220,x         ; $04C82F   |

CODE_04C832:
    RTS                 ; $04C832   |

    LDY $18,x           ; $04C833   |
    LDA $6F00,y         ; $04C835   |
    CMP #$0010          ; $04C838   |
    BNE CODE_04C84D     ; $04C83B   |
    LDA $7360,y         ; $04C83D   |
    CMP #$015E          ; $04C840   |
    BNE CODE_04C84D     ; $04C843   |
    LDA $0FF9           ; $04C845   |
    CMP $7900,x         ; $04C848   |
    BEQ CODE_04C853     ; $04C84B   |

CODE_04C84D:
    PLY                 ; $04C84D   |
    PLA                 ; $04C84E   |
    JMP CODE_0403A3     ; $04C84F   |

CODE_04C853:
    LDY $78,x           ; $04C853   |
    LDA $0FF9,y         ; $04C855   |
    SEC                 ; $04C858   |
    SBC $7A36,x         ; $04C859   |
    CLC                 ; $04C85C   |
    ADC $70E2,x         ; $04C85D   |
    STA $70E2,x         ; $04C860   |
    LDA $1001,y         ; $04C863   |
    SEC                 ; $04C866   |
    SBC $7A38,x         ; $04C867   |
    CLC                 ; $04C86A   |
    ADC $7182,x         ; $04C86B   |
    STA $7182,x         ; $04C86E   |
    LDA $1001,y         ; $04C871   |
    SEC                 ; $04C874   |
    SBC #$0010          ; $04C875   |
    CMP $7182,x         ; $04C878   |
    BPL CODE_04C886     ; $04C87B   |
    STA $7182,x         ; $04C87D   |
    STZ $7222,x         ; $04C880   |
    STZ $7542,x         ; $04C883   |

CODE_04C886:
    LDA $0FF9,y         ; $04C886   |
    STA $7A36,x         ; $04C889   |
    LDA $1001,y         ; $04C88C   |
    STA $7A38,x         ; $04C88F   |
    LDY $77C2,x         ; $04C892   |
    TYA                 ; $04C895   |
    STA $7400,x         ; $04C896   |
    RTL                 ; $04C899   |

.init_bubbled_1_up
    RTL                 ; $04C89A   |

.main_bubbled_1_up
    STZ $7400,x         ; $04C89B   |
    LDY $18,x           ; $04C89E   |
    BEQ CODE_04C8B8     ; $04C8A0   |
    LDA $7362,x         ; $04C8A2   |
    BMI CODE_04C8B8     ; $04C8A5   |
    REP #$10            ; $04C8A7   |
    TAY                 ; $04C8A9   |
    LDA $6024,y         ; $04C8AA   |
    AND #$FF00          ; $04C8AD   |
    ORA #$004A          ; $04C8B0   |
    STA $6024,y         ; $04C8B3   |
    SEP #$10            ; $04C8B6   |

CODE_04C8B8:
    JSL $03AF23         ; $04C8B8   |
    LDY $76,x           ; $04C8BC   |
    BNE CODE_04C8C3     ; $04C8BE   |
    INC $76,x           ; $04C8C0   |
    RTL                 ; $04C8C2   |

CODE_04C8C3:
    LDY $7D36,x         ; $04C8C3   |
    BMI CODE_04C8DD     ; $04C8C6   |
    BEQ CODE_04C92D     ; $04C8C8   |
    LDA $6EFF,y         ; $04C8CA   |
    CMP #$0010          ; $04C8CD   |
    BNE CODE_04C92D     ; $04C8D0   |
    LDA $7D37,y         ; $04C8D2   |
    BEQ CODE_04C92D     ; $04C8D5   |
    DEY                 ; $04C8D7   |
    TYX                 ; $04C8D8   |
    JSL $03B25B         ; $04C8D9   |

CODE_04C8DD:
    LDA $7CD6,x         ; $04C8DD   |
    SEC                 ; $04C8E0   |
    SBC #$0008          ; $04C8E1   |
    STA $0000           ; $04C8E4   |
    LDA $7CD8,x         ; $04C8E7   |
    SEC                 ; $04C8EA   |
    SBC #$0008          ; $04C8EB   |
    STA $0002           ; $04C8EE   |
    LDY $18,x           ; $04C8F1   |
    BNE CODE_04C8FB     ; $04C8F3   |
    JSL $03A4A2         ; $04C8F5   |
    BRA CODE_04C8FF     ; $04C8F9   |

CODE_04C8FB:
    JSL $03A491         ; $04C8FB   |

CODE_04C8FF:
    LDA #$01E4          ; $04C8FF   |
    JSL $008B21         ; $04C902   |
    LDA $70E2,x         ; $04C906   |
    STA $70A2,y         ; $04C909   |
    LDA $7182,x         ; $04C90C   |
    STA $7142,y         ; $04C90F   |
    LDA #$000C          ; $04C912   |
    STA $73C2,y         ; $04C915   |
    LDA #$0008          ; $04C918   |
    STA $7782,y         ; $04C91B   |
    LDA $78,x           ; $04C91E   |
    STA $04             ; $04C920   |
    LDA $7A36,x         ; $04C922   |
    JSL $03D3F3         ; $04C925   |
    JMP CODE_0403A3     ; $04C929   |

CODE_04C92D:
    LDA $75E2,x         ; $04C92D   |
    SEC                 ; $04C930   |
    SBC $7222,x         ; $04C931   |
    CLC                 ; $04C934   |
    ADC #$0002          ; $04C935   |
    CMP #$0004          ; $04C938   |
    BCS CODE_04C947     ; $04C93B   |
    LDA $75E2,x         ; $04C93D   |
    EOR #$FFFF          ; $04C940   |
    INC A               ; $04C943   |
    STA $75E2,x         ; $04C944   |

CODE_04C947:
    LDA $7A98,x         ; $04C947   |
    BNE CODE_04C95C     ; $04C94A   |
    LDA #$0008          ; $04C94C   |
    STA $7A98,x         ; $04C94F   |
    LDA $7402,x         ; $04C952   |
    INC A               ; $04C955   |
    AND #$0003          ; $04C956   |
    STA $7402,x         ; $04C959   |

CODE_04C95C:
    LDA $7860,x         ; $04C95C   |
    AND #$0001          ; $04C95F   |
    BEQ CODE_04C967     ; $04C962   |
    STZ $7222,x         ; $04C964   |

CODE_04C967:
    RTL                 ; $04C967   |

.init_coin_with_gravity
    LDA #$0100          ; $04C968   |
    STA $7A96,x         ; $04C96B   |
    LDA #$0140          ; $04C96E   |
    STA $7A98,x         ; $04C971   |
    LDA #$0010          ; $04C974   |
    STA $7AF6,x         ; $04C977   |
    RTL                 ; $04C97A   |

.main_coin_with_gravity
    JSL $03AF23         ; $04C97B   |
    LDA $7974           ; $04C97F   |
    LSR A               ; $04C982   |
    LSR A               ; $04C983   |
    LSR A               ; $04C984   |
    AND #$0003          ; $04C985   |
    STA $7402,x         ; $04C988   |
    LDY $76,x           ; $04C98B   |
    BEQ CODE_04C9BF     ; $04C98D   |
    LDA $7860,x         ; $04C98F   |
    LSR A               ; $04C992   |
    BCC CODE_04C9BE     ; $04C993   |
    JSL $04C968         ; $04C995   |
    LDA $10             ; $04C999   |
    AND #$01FF          ; $04C99B   |
    CLC                 ; $04C99E   |
    ADC #$FF80          ; $04C99F   |
    STA $7220,x         ; $04C9A2   |
    LDA $10             ; $04C9A5   |
    XBA                 ; $04C9A7   |
    AND #$01FF          ; $04C9A8   |
    EOR #$FFFF          ; $04C9AB   |
    INC A               ; $04C9AE   |
    CLC                 ; $04C9AF   |
    ADC #$FE00          ; $04C9B0   |
    STA $7222,x         ; $04C9B3   |
    LDA #$0002          ; $04C9B6   |
    STA $74A2,x         ; $04C9B9   |
    STZ $76,x           ; $04C9BC   |

CODE_04C9BE:
    RTL                 ; $04C9BE   |

CODE_04C9BF:
    LDA $7860,x         ; $04C9BF   |
    LSR A               ; $04C9C2   |
    BCC CODE_04C9DB     ; $04C9C3   |
    LDA $7220,x         ; $04C9C5   |
    CMP #$8000          ; $04C9C8   |
    ROR A               ; $04C9CB   |
    STA $7220,x         ; $04C9CC   |
    LDA #$FD80          ; $04C9CF   |
    STA $7222,x         ; $04C9D2   |
    LDA #$0040          ; $04C9D5   |
    STA $7542,x         ; $04C9D8   |

CODE_04C9DB:
    LDA $7AF6,x         ; $04C9DB   |
    BNE CODE_04CA09     ; $04C9DE   |
    LDY $7D36,x         ; $04C9E0   |
    BEQ CODE_04CA09     ; $04C9E3   |
    BMI CODE_04CA01     ; $04C9E5   |
    LDA $6EFF,y         ; $04C9E7   |
    CMP #$0010          ; $04C9EA   |
    BNE CODE_04CA09     ; $04C9ED   |
    LDA $7D37,y         ; $04C9EF   |
    BEQ CODE_04CA09     ; $04C9F2   |
    LDA $735F,y         ; $04C9F4   |
    CMP #$0022          ; $04C9F7   |
    BMI CODE_04CA09     ; $04C9FA   |
    CMP #$002C          ; $04C9FC   |
    BPL CODE_04CA09     ; $04C9FF   |

CODE_04CA01:
    JSL $04CA3A         ; $04CA01   |
    JMP CODE_0403A3     ; $04CA05   |

CODE_04CA09:
    LDA $7A96,x         ; $04CA09   |
    BNE CODE_04CA26     ; $04CA0C   |
    LDA $7A98,x         ; $04CA0E   |
    BNE CODE_04CA1B     ; $04CA11   |
    LDY $78,x           ; $04CA13   |
    BNE CODE_04CA01     ; $04CA15   |
    JMP CODE_0403A3     ; $04CA17   |

CODE_04CA1B:
    LDA $7974           ; $04CA1B   |
    AND #$0001          ; $04CA1E   |
    ASL A               ; $04CA21   |
    DEC A               ; $04CA22   |
    STA $74A2,x         ; $04CA23   |

CODE_04CA26:
    RTL                 ; $04CA26   |

    PHB                 ; $04CA27   |
    PHK                 ; $04CA28   |
    PLB                 ; $04CA29   |
    PHD                 ; $04CA2A   |
    LDA #$7960          ; $04CA2B   |
    TCD                 ; $04CA2E   |
    JSL $04CA3A         ; $04CA2F   |
    JSL $03A32E         ; $04CA33   |
    PLD                 ; $04CA37   |
    PLB                 ; $04CA38   |
    RTL                 ; $04CA39   |

    LDA #$01E4          ; $04CA3A   |
    JSL $008B21         ; $04CA3D   |
    LDA $70E2,x         ; $04CA41   |
    STA $70A2,y         ; $04CA44   |
    LDA $7182,x         ; $04CA47   |
    STA $7142,y         ; $04CA4A   |
    LDA #$000C          ; $04CA4D   |
    STA $73C2,y         ; $04CA50   |
    LDA #$0008          ; $04CA53   |
    STA $7782,y         ; $04CA56   |
    JSL $03B353         ; $04CA59   |
    JMP CODE_040CF9     ; $04CA5D   |

.init_thunder_lakitu_fire_stuff              ; "head of fire", "fire", and "hypocenter of thunder"
    RTL                 ; $04CA61   |

.main_head_of_fire                           ; the fuck is this sprite even
    JSL $03AF23         ; $04CA62   |
    LDA $7860,x         ; $04CA66   |
    BIT #$0001          ; $04CA69   |
    BEQ CODE_04CA73     ; $04CA6C   |
    AND #$000C          ; $04CA6E   |
    BEQ CODE_04CA77     ; $04CA71   |

CODE_04CA73:
    JMP CODE_0403A3     ; $04CA73   |

CODE_04CA77:
    LDA $7A96,x         ; $04CA77   |
    BNE CODE_04CABC     ; $04CA7A   |
    LDA #$004B          ; $04CA7C   |
    JSL $03A364         ; $04CA7F   |
    BCC CODE_04CABC     ; $04CA83   |
    LDA $70E2,x         ; $04CA85   |
    STA $70E2,y         ; $04CA88   |
    LDA $7182,x         ; $04CA8B   |
    STA $7182,y         ; $04CA8E   |
    LDA #$0001          ; $04CA91   |
    STA $7402,y         ; $04CA94   |
    INC A               ; $04CA97   |
    STA $7BB8,y         ; $04CA98   |
    INC A               ; $04CA9B   |
    STA $7A98,y         ; $04CA9C   |
    LDA #$0008          ; $04CA9F   |
    STA $7978,y         ; $04CAA2   |
    LDA #$000B          ; $04CAA5   |
    STA $79D8,y         ; $04CAA8   |
    INC A               ; $04CAAB   |
    STA $7B58,y         ; $04CAAC   |
    LDA #$0039          ; $04CAAF   |\ play sound #$0039
    JSL $0085D2         ; $04CAB2   |/
    LDA #$0006          ; $04CAB6   |
    STA $7A96,x         ; $04CAB9   |

CODE_04CABC:
    LDA $70E2,x         ; $04CABC   |
    SEC                 ; $04CABF   |
    SBC $7902,x         ; $04CAC0   |
    CLC                 ; $04CAC3   |
    ADC #$0080          ; $04CAC4   |
    CMP #$0100          ; $04CAC7   |
    BCS CODE_04CA73     ; $04CACA   |
    RTL                 ; $04CACC   |

DATA_04CACD:         db $0B, $0A, $09, $08, $07, $06, $05, $04
DATA_04CAD5:         db $03, $02, $01, $12, $11, $09, $10

DATA_04CADC:         db $0F, $0E, $0D, $0C, $04, $08, $0C, $10
DATA_04CAE4:         db $08, $04, $02, $00, $00, $00, $00

DATA_04CAEB:         db $04, $06, $0A, $04, $0C, $08, $04, $00
DATA_04CAF3:         db $08, $0C, $0E, $00, $00, $00, $00, $0C
DATA_04CAFB:         db $0A, $06, $0C

.main_thunder_lakitu_fire_stuff              ; "fire" and "hypocenter of thunder"
    JSL $03AF23         ; $04CAFE   |
    LDA $7A98,x         ; $04CB02   |
    BNE CODE_04CB36     ; $04CB05   |
    DEC $18,x           ; $04CB07   |
    BPL CODE_04CB0F     ; $04CB09   |
    JMP CODE_0403A3     ; $04CB0B   |

CODE_04CB0F:
    LDA $18,x           ; $04CB0F   |
    CLC                 ; $04CB11   |
    ADC $78,x           ; $04CB12   |
    TAY                 ; $04CB14   |
    LDA $CACD,y         ; $04CB15   |
    AND #$00FF          ; $04CB18   |
    STA $7402,x         ; $04CB1B   |
    LDA #$0003          ; $04CB1E   |
    STA $7A98,x         ; $04CB21   |
    LDA $CADC,y         ; $04CB24   |
    AND #$00FF          ; $04CB27   |
    STA $7BB8,x         ; $04CB2A   |
    LDA $CAEB,y         ; $04CB2D   |
    AND #$00FF          ; $04CB30   |
    STA $7B58,x         ; $04CB33   |

CODE_04CB36:
    LDY $18,x           ; $04CB36   |
    CPY #$04            ; $04CB38   |
    BMI CODE_04CB45     ; $04CB3A   |
    LDY $7D36,x         ; $04CB3C   |
    BPL CODE_04CB45     ; $04CB3F   |
    JSL $03A858         ; $04CB41   |

CODE_04CB45:
    RTL                 ; $04CB45   |

.init_donut_lift                             ; both normal and giant
    LDY #$08            ; $04CB46   |
    LDA $7360,x         ; $04CB48   |
    CMP #$0117          ; $04CB4B   |
    BEQ CODE_04CB52     ; $04CB4E   |
    LDY #$10            ; $04CB50   |

CODE_04CB52:
    TYA                 ; $04CB52   |
    STA $7BB6,x         ; $04CB53   |
    STA $7BB8,x         ; $04CB56   |
    RTL                 ; $04CB59   |

DATA_04CB5A:         dw $0001, $0004

DATA_04CB5E:         dw $7502, $7500, $7501, $3DAA
DATA_04CB66:         dw $3DAB

DATA_04CB68:         dw $0000, $0000, $0010, $FFF0
DATA_04CB70:         dw $0010

DATA_04CB72:         dw $0000, $0000, $0000, $0010
DATA_04CB7A:         dw $0000

.main_donut_lift                             ; both normal and giant
    STZ $7400,x         ; $04CB7C   |
    JSL $03AF23         ; $04CB7F   |
    LDY $76,x           ; $04CB83   |
    BEQ CODE_04CB8B     ; $04CB85   |
    JMP CODE_0403A3     ; $04CB87   |

CODE_04CB8B:
    LDA $7A96,x         ; $04CB8B   |
    DEC A               ; $04CB8E   |
    CMP #$0050          ; $04CB8F   |
    BCS CODE_04CBB6     ; $04CB92   |
    CMP #$0040          ; $04CB94   |
    BNE CODE_04CB9F     ; $04CB97   |
    LDA #$0004          ; $04CB99   |
    STA $7542,x         ; $04CB9C   |

CODE_04CB9F:
    LDA $14             ; $04CB9F   |
    LSR A               ; $04CBA1   |
    BCC CODE_04CBB6     ; $04CBA2   |
    LDA $70E2,x         ; $04CBA4   |
    EOR #$0001          ; $04CBA7   |
    PHA                 ; $04CBAA   |
    SEC                 ; $04CBAB   |
    SBC $70E2,x         ; $04CBAC   |
    STA $72C0,x         ; $04CBAF   |
    PLA                 ; $04CBB2   |
    STA $70E2,x         ; $04CBB3   |

CODE_04CBB6:
    LDA $61B4           ; $04CBB6   |
    PHA                 ; $04CBB9   |
    JSL $03D22D         ; $04CBBA   |
    PLA                 ; $04CBBE   |
    SEC                 ; $04CBBF   |
    SBC $61B4           ; $04CBC0   |
    ORA $7542,x         ; $04CBC3   |
    BNE CODE_04CBF9     ; $04CBC6   |
    LDA $7362,x         ; $04CBC8   |
    BMI CODE_04CBF9     ; $04CBCB   |
    LDA $70E2,x         ; $04CBCD   |
    STA $04             ; $04CBD0   |
    LDA $7182,x         ; $04CBD2   |
    STA $06             ; $04CBD5   |
    LDA $7360,x         ; $04CBD7   |
    SEC                 ; $04CBDA   |
    SBC #$0117          ; $04CBDB   |
    ASL A               ; $04CBDE   |
    TAY                 ; $04CBDF   |
    LDA $CB5A,y         ; $04CBE0   |
    STA $00             ; $04CBE3   |

CODE_04CBE5:
    LDA $CB5E,y         ; $04CBE5   |
    STA $02             ; $04CBE8   |
    PHY                 ; $04CBEA   |
    JSR CODE_04CBFA     ; $04CBEB   |
    LDX $12             ; $04CBEE   |
    PLY                 ; $04CBF0   |
    INY                 ; $04CBF1   |
    INY                 ; $04CBF2   |
    DEC $00             ; $04CBF3   |
    BNE CODE_04CBE5     ; $04CBF5   |
    INC $76,x           ; $04CBF7   |

CODE_04CBF9:
    RTL                 ; $04CBF9   |

CODE_04CBFA:
    LDA $CB68,y         ; $04CBFA   |
    CLC                 ; $04CBFD   |
    ADC $04             ; $04CBFE   |
    STA $04             ; $04CC00   |
    LDA $CB72,y         ; $04CC02   |
    CLC                 ; $04CC05   |
    ADC $06             ; $04CC06   |
    STA $06             ; $04CC08   |
    LDA $04             ; $04CC0A   |
    STA $0091           ; $04CC0C   |
    LDA $06             ; $04CC0F   |
    STA $0093           ; $04CC11   |
    LDA #$0001          ; $04CC14   |
    STA $008F           ; $04CC17   |
    LDA $02             ; $04CC1A   |
    STA $0095           ; $04CC1C   |
    JSL $109295         ; $04CC1F   |
    RTS                 ; $04CC23   |

.init_number_platform_explosion
    RTL                 ; $04CC24   |

DATA_04CC25:         dw $0000, $0000, $0000, $0000
DATA_04CC2D:         dw $7600, $7601, $7775, $7776
DATA_04CC35:         dw $7602, $7603, $7777, $7778
DATA_04CC3D:         dw $7604, $7605, $7779, $777A

    JSL $03AF23         ; $04CC45   |
    LDY $76,x           ; $04CC49   |
    BNE CODE_04CC50     ; $04CC4B   |
    INC $76,x           ; $04CC4D   |
    RTL                 ; $04CC4F   |

CODE_04CC50:
    LDA $61B4           ; $04CC50   |
    PHA                 ; $04CC53   |
    JSL $03D22D         ; $04CC54   |
    PLA                 ; $04CC58   |
    CMP $61B4           ; $04CC59   |
    BNE CODE_04CCAC     ; $04CC5C   |
    LDA #$003B          ; $04CC5E   |\ play sound #$003B
    JSL $0085D2         ; $04CC61   |/
    LDA $18,x           ; $04CC65   |
    BNE CODE_04CC7C     ; $04CC67   |
    LDA $7CD6,x         ; $04CC69   |
    STA $00             ; $04CC6C   |
    LDA $7CD8,x         ; $04CC6E   |
    STA $02             ; $04CC71   |
    LDA #$01E6          ; $04CC73   |
    JSL $03B56E         ; $04CC76   |
    LDA $18,x           ; $04CC7A   |

CODE_04CC7C:
    ASL A               ; $04CC7C   |
    ASL A               ; $04CC7D   |
    ASL A               ; $04CC7E   |
    TAY                 ; $04CC7F   |
    LDA $70E2,x         ; $04CC80   |
    STA $04             ; $04CC83   |
    LDA $7182,x         ; $04CC85   |
    STA $06             ; $04CC88   |
    LDA #$0004          ; $04CC8A   |
    STA $00             ; $04CC8D   |

CODE_04CC8F:
    LDA $CC25,y         ; $04CC8F   |
    STA $02             ; $04CC92   |
    PHY                 ; $04CC94   |
    TYA                 ; $04CC95   |
    AND #$0007          ; $04CC96   |
    TAY                 ; $04CC99   |
    INY                 ; $04CC9A   |
    INY                 ; $04CC9B   |
    JSR CODE_04CBFA     ; $04CC9C   |
    LDX $12             ; $04CC9F   |
    PLY                 ; $04CCA1   |
    INY                 ; $04CCA2   |
    INY                 ; $04CCA3   |
    DEC $00             ; $04CCA4   |
    BNE CODE_04CC8F     ; $04CCA6   |
    JSL $03A31E         ; $04CCA8   |

CODE_04CCAC:
    RTL                 ; $04CCAC   |

DATA_04CCAD:         dw $FFBD, $0046

.init_spike
    INC $78,x           ; $04CCB1   |
    LDY #$00            ; $04CCB3   |
    LDA $608C           ; $04CCB5   |
    SEC                 ; $04CCB8   |
    SBC $70E2,x         ; $04CCB9   |
    BMI CODE_04CCC0     ; $04CCBC   |
    INY                 ; $04CCBE   |
    INY                 ; $04CCBF   |

CODE_04CCC0:
    TYA                 ; $04CCC0   |
    STA $7400,x         ; $04CCC1   |
    LDA $CCAD,y         ; $04CCC4   |
    STA $75E0,x         ; $04CCC7   |
    RTL                 ; $04CCCA   |

DATA_04CCCB:         dw $CD26
DATA_04CCCD:         dw $CE25
DATA_04CCCF:         dw $CE46
DATA_04CCD1:         dw $8EB5

.main_spike
    LDY $7722,x         ; $04CCD3   |
    BMI CODE_04CCDC     ; $04CCD6   |
    JSL $03AA2E         ; $04CCD8   |

CODE_04CCDC:
    LDY $76,x           ; $04CCDC   |
    CPY #$03            ; $04CCDE   |
    BNE CODE_04CD01     ; $04CCE0   |
    LDA $6F00,x         ; $04CCE2   |
    CMP #$0010          ; $04CCE5   |
    BNE CODE_04CD01     ; $04CCE8   |
    LDA $61B0           ; $04CCEA   |
    ORA $0B55           ; $04CCED   |
    ORA $0398           ; $04CCF0   |
    BNE CODE_04CD22     ; $04CCF3   |
    LDA $7860,x         ; $04CCF5   |
    AND #$000C          ; $04CCF8   |
    BEQ CODE_04CD05     ; $04CCFB   |
    JMP CODE_0403B2     ; $04CCFD   |

CODE_04CD01:
    JSL $03AF23         ; $04CD01   |

CODE_04CD05:
    TXY                 ; $04CD05   |
    LDA $76,x           ; $04CD06   |
    ASL A               ; $04CD08   |
    TAX                 ; $04CD09   |
    JSR ($CCCB,x)       ; $04CD0A   |

    LDY #$00            ; $04CD0D   |
    LDA $75E0,x         ; $04CD0F   |
    BEQ CODE_04CD1C     ; $04CD12   |
    BMI CODE_04CD18     ; $04CD14   |
    INY                 ; $04CD16   |
    INY                 ; $04CD17   |

CODE_04CD18:
    TYA                 ; $04CD18   |
    STA $7400,x         ; $04CD19   |

CODE_04CD1C:
    JSR CODE_048B8D     ; $04CD1C   |
    JSR CODE_048BDF     ; $04CD1F   |

CODE_04CD22:
    RTL                 ; $04CD22   |

DATA_04CD23:         db $0C, $20, $18

    TYX                 ; $04CD26   |
    STZ $7540,x         ; $04CD27   |
    LDY $7402,x         ; $04CD2A   |
    CPY #$03            ; $04CD2D   |
    BMI CODE_04CD45     ; $04CD2F   |
    LDA $7A96,x         ; $04CD31   |
    BEQ CODE_04CD37     ; $04CD34   |
    RTS                 ; $04CD36   |

CODE_04CD37:
    INC $7402,x         ; $04CD37   |
    LDY $7402,x         ; $04CD3A   |
    CPY #$05            ; $04CD3D   |
    BMI CODE_04CDB9     ; $04CD3F   |
    INC $76,x           ; $04CD41   |
    BRA CODE_04CDB9     ; $04CD43   |

CODE_04CD45:
    LDA $7A98,x         ; $04CD45   |
    BEQ CODE_04CD4D     ; $04CD48   |
    JMP CODE_04CDCC     ; $04CD4A   |

CODE_04CD4D:
    LDA $75E0,x         ; $04CD4D   |
    EOR $7C16,x         ; $04CD50   |
    BPL CODE_04CDCC     ; $04CD53   |
    LDA $7C16,x         ; $04CD55   |
    CLC                 ; $04CD58   |
    ADC #$0060          ; $04CD59   |
    CMP #$00C0          ; $04CD5C   |
    BCS CODE_04CDCC     ; $04CD5F   |
    LDA $7C18,x         ; $04CD61   |
    CLC                 ; $04CD64   |
    ADC #$0030          ; $04CD65   |
    CMP #$0060          ; $04CD68   |
    BCS CODE_04CDCC     ; $04CD6B   |
    LDA #$0075          ; $04CD6D   |
    JSL $03A34C         ; $04CD70   |
    BCC CODE_04CDCC     ; $04CD74   |
    PHX                 ; $04CD76   |
    TYX                 ; $04CD77   |
    JSL $03AD74         ; $04CD78   |
    BCC CODE_04CDB4     ; $04CD7C   |
    TXY                 ; $04CD7E   |
    PLX                 ; $04CD7F   |
    LDA $70E2,x         ; $04CD80   |
    STA $70E2,y         ; $04CD83   |
    LDA $7182,x         ; $04CD86   |
    STA $7182,y         ; $04CD89   |
    LDA #$01C0          ; $04CD8C   |
    STA $7A38,y         ; $04CD8F   |
    LDA #$0080          ; $04CD92   |
    STA $7A36,y         ; $04CD95   |
    SEP #$20            ; $04CD98   |
    LDA $7400,x         ; $04CD9A   |
    STA $7400,y         ; $04CD9D   |
    REP #$20            ; $04CDA0   |
    TXA                 ; $04CDA2   |
    STA $7978,y         ; $04CDA3   |
    LDA #$0002          ; $04CDA6   |
    STA $6F00,y         ; $04CDA9   |
    LDA #$0003          ; $04CDAC   |
    STA $7402,x         ; $04CDAF   |
    BRA CODE_04CDB9     ; $04CDB2   |

CODE_04CDB4:
    JSL $03A31E         ; $04CDB4   |
    PLX                 ; $04CDB8   |

CODE_04CDB9:
    LDY $7402,x         ; $04CDB9   |
    LDA $CD20,y         ; $04CDBC   |
    AND #$00FF          ; $04CDBF   |
    STA $7A96,x         ; $04CDC2   |
    STZ $7220,x         ; $04CDC5   |
    STZ $7540,x         ; $04CDC8   |
    RTS                 ; $04CDCB   |

CODE_04CDCC:
    LDA #$000B          ; $04CDCC   |
    STA $7540,x         ; $04CDCF   |
    LDA $7860,x         ; $04CDD2   |
    BIT #$000C          ; $04CDD5   |
    BNE CODE_04CDE9     ; $04CDD8   |
    AND #$0001          ; $04CDDA   |
    STA $00             ; $04CDDD   |
    LDA $6F02,x         ; $04CDDF   |
    AND #$00FF          ; $04CDE2   |
    ORA $00             ; $04CDE5   |
    BNE CODE_04CDEF     ; $04CDE7   |

CODE_04CDE9:
    LDA #$0020          ; $04CDE9   |
    STA $7A98,x         ; $04CDEC   |

CODE_04CDEF:
    LDA $7220,x         ; $04CDEF   |
    BPL CODE_04CDF8     ; $04CDF2   |
    EOR #$FFFF          ; $04CDF4   |
    INC A               ; $04CDF7   |

CODE_04CDF8:
    CLC                 ; $04CDF8   |
    ADC $18,x           ; $04CDF9   |
    CMP #$0200          ; $04CDFB   |
    BCC CODE_04CE1E     ; $04CDFE   |
    PHA                 ; $04CE00   |
    LDA $7402,x         ; $04CE01   |
    CLC                 ; $04CE04   |
    ADC $78,x           ; $04CE05   |
    CMP #$0003          ; $04CE07   |
    BCC CODE_04CE16     ; $04CE0A   |
    LDA $78,x           ; $04CE0C   |
    EOR #$FFFF          ; $04CE0E   |
    INC A               ; $04CE11   |
    STA $78,x           ; $04CE12   |
    BRA CODE_04CE19     ; $04CE14   |

CODE_04CE16:
    STA $7402,x         ; $04CE16   |

CODE_04CE19:
    PLA                 ; $04CE19   |
    SEC                 ; $04CE1A   |
    SBC #$0200          ; $04CE1B   |

CODE_04CE1E:
    STA $18,x           ; $04CE1E   |
    RTS                 ; $04CE20   |

DATA_04CE21:         dw $0059, $FFA7

    TYX                 ; $04CE25   |
    LDA $7A96,x         ; $04CE26   |
    BNE CODE_04CE45     ; $04CE29   |
    LDA #$0002          ; $04CE2B   |
    STA $7402,x         ; $04CE2E   |
    LDA #$FE9A          ; $04CE31   |
    STA $7222,x         ; $04CE34   |
    STZ $7860,x         ; $04CE37   |
    LDY $7400,x         ; $04CE3A   |
    LDA $CE21,y         ; $04CE3D   |
    STA $7220,x         ; $04CE40   |
    INC $76,x           ; $04CE43   |

CODE_04CE45:
    RTS                 ; $04CE45   |

    TYX                 ; $04CE46   |
    LDA $7860,x         ; $04CE47   |
    AND #$0001          ; $04CE4A   |
    BEQ CODE_04CE5D     ; $04CE4D   |
    STZ $7220,x         ; $04CE4F   |
    LDA #$0060          ; $04CE52   |
    STA $7A98,x         ; $04CE55   |
    STZ $7402,x         ; $04CE58   |
    STZ $76,x           ; $04CE5B   |

CODE_04CE5D:
    RTS                 ; $04CE5D   |

.init_spiked_ball
    JSR CODE_04CF1A     ; $04CE5E   |
    RTL                 ; $04CE61   |

DATA_04CE62:         dw $0010, $FFF0

DATA_04CE66:         dw $CF72
DATA_04CE68:         dw $CF88
DATA_04CE6A:         dw $CFA2
DATA_04CE6C:         dw $CFCA
DATA_04CE6E:         dw $8000

.main_spiked_ball
    LDY $74A2,x         ; $04CE70   |
    BMI CODE_04CE79     ; $04CE73   |
    JSL $03AA52         ; $04CE75   |

CODE_04CE79:
    JSL $03AF23         ; $04CE79   |
    LDY $18,x           ; $04CE7D   |
    LDA $6F00,y         ; $04CE7F   |
    CMP #$0010          ; $04CE82   |
    BNE CODE_04CE8C     ; $04CE85   |
    LDA $7D38,y         ; $04CE87   |
    BEQ CODE_04CEA2     ; $04CE8A   |

CODE_04CE8C:
    LDY $76,x           ; $04CE8C   |
    CPY #$03            ; $04CE8E   |
    BPL CODE_04CEA2     ; $04CE90   |
    LDA #$02CC          ; $04CE92   |
    STA $75E2,x         ; $04CE95   |
    LDA #$002C          ; $04CE98   |
    STA $7542,x         ; $04CE9B   |
    LDY #$04            ; $04CE9E   |
    STY $76,x           ; $04CEA0   |

CODE_04CEA2:
    TXY                 ; $04CEA2   |
    LDA $76,x           ; $04CEA3   |
    ASL A               ; $04CEA5   |
    TAX                 ; $04CEA6   |
    JSR ($CE66,x)       ; $04CEA7   |

    LDA $7722,x         ; $04CEAA   |
    LSR A               ; $04CEAD   |
    LSR A               ; $04CEAE   |
    LSR A               ; $04CEAF   |
    SEC                 ; $04CEB0   |
    SBC $0030           ; $04CEB1   |
    AND #$0003          ; $04CEB4   |
    BEQ CODE_04CEBA     ; $04CEB7   |
    RTL                 ; $04CEB9   |

CODE_04CEBA:
    LDA #$0002          ; $04CEBA   |
    STA $74A2,x         ; $04CEBD   |
    JSR CODE_04CF1A     ; $04CEC0   |
    LDY $76,x           ; $04CEC3   |
    CPY #$03            ; $04CEC5   |
    BPL CODE_04CEDF     ; $04CEC7   |
    LDY $18,x           ; $04CEC9   |
    LDA $70E2,y         ; $04CECB   |
    SEC                 ; $04CECE   |
    SBC $6022           ; $04CECF   |
    STA $70E2,x         ; $04CED2   |
    LDA $7182,y         ; $04CED5   |
    SEC                 ; $04CED8   |
    SBC $6020           ; $04CED9   |
    STA $7182,x         ; $04CEDC   |

CODE_04CEDF:
    LDA $70E2,x         ; $04CEDF   |
    CLC                 ; $04CEE2   |
    ADC #$0008          ; $04CEE3   |
    SEC                 ; $04CEE6   |
    SBC $611C           ; $04CEE7   |
    CLC                 ; $04CEEA   |
    ADC $6024           ; $04CEEB   |
    CMP $6026           ; $04CEEE   |
    BCS CODE_04CF19     ; $04CEF1   |
    LDA $7182,x         ; $04CEF3   |
    CLC                 ; $04CEF6   |
    ADC #$0008          ; $04CEF7   |
    SEC                 ; $04CEFA   |
    SBC $611E           ; $04CEFB   |
    CLC                 ; $04CEFE   |
    ADC $6028           ; $04CEFF   |
    CMP $602A           ; $04CF02   |
    BCS CODE_04CF19     ; $04CF05   |
    LDA $61D6           ; $04CF07   |
    BNE CODE_04CF19     ; $04CF0A   |
    LDA $7220,x         ; $04CF0C   |
    STA $60A8           ; $04CF0F   |
    STA $60B4           ; $04CF12   |
    JSL $03A858         ; $04CF15   |

CODE_04CF19:
    RTL                 ; $04CF19   |

CODE_04CF1A:
    LDA #$6000          ; $04CF1A   |
    STA $3018           ; $04CF1D   |
    LDA #$0054          ; $04CF20   |
    STA $301A           ; $04CF23   |
    LDA $7A38,x         ; $04CF26   |
    LSR A               ; $04CF29   |
    STA $300A           ; $04CF2A   |
    LDA $7A36,x         ; $04CF2D   |
    STA $3008           ; $04CF30   |
    LDA #$0A00          ; $04CF33   |
    STA $300C           ; $04CF36   |
    LDA #$0600          ; $04CF39   |
    STA $3014           ; $04CF3C   |
    LDA $6120           ; $04CF3F   |
    STA $3002           ; $04CF42   |
    LDA $6122           ; $04CF45   |
    STA $3010           ; $04CF48   |
    LDA $7400,x         ; $04CF4B   |
    STA $300E           ; $04CF4E   |
    LDY $7722,x         ; $04CF51   |
    TYX                 ; $04CF54   |
    LDA $03A9CE,x       ; $04CF55   |
    STA $3006           ; $04CF59   |
    LDA $03A9EE,x       ; $04CF5C   |
    STA $3004           ; $04CF60   |
    LDX #$08            ; $04CF63   |
    LDA #$D69F          ; $04CF65   |
    JSL $7EDE44         ; $04CF68   | GSU init
    LDX $12             ; $04CF6C   |
    INC $0CF9           ; $04CF6E   |
    RTS                 ; $04CF71   |

    TYX                 ; $04CF72   |
    LDA $7A36,x         ; $04CF73   |
    CLC                 ; $04CF76   |
    ADC #$0009          ; $04CF77   |
    CMP #$01FF          ; $04CF7A   |
    BMI CODE_04CF84     ; $04CF7D   |
    INC $76,x           ; $04CF7F   |
    LDA #$01FF          ; $04CF81   |

CODE_04CF84:
    STA $7A36,x         ; $04CF84   |
    RTS                 ; $04CF87   |

    TYX                 ; $04CF88   |
    LDA $7A38,x         ; $04CF89   |
    SEC                 ; $04CF8C   |
    SBC #$0008          ; $04CF8D   |
    AND #$01FE          ; $04CF90   |
    CMP #$0160          ; $04CF93   |
    BCS CODE_04CF9A     ; $04CF96   |
    INC $76,x           ; $04CF98   |

CODE_04CF9A:
    STA $7A38,x         ; $04CF9A   |
    RTS                 ; $04CF9D   |

DATA_04CF9E:         dw $FDE7, $0219

    TYX                 ; $04CFA2   |
    LDA $7A38,x         ; $04CFA3   |
    CLC                 ; $04CFA6   |
    ADC #$0008          ; $04CFA7   |
    AND #$01FE          ; $04CFAA   |
    CMP #$0180          ; $04CFAD   |
    BCC CODE_04CFC6     ; $04CFB0   |
    LDY #$00            ; $04CFB2   |
    LDA $7400,x         ; $04CFB4   |
    BEQ CODE_04CFBB     ; $04CFB7   |
    INY                 ; $04CFB9   |
    INY                 ; $04CFBA   |

CODE_04CFBB:
    LDA $CF9E,y         ; $04CFBB   |
    STA $7220,x         ; $04CFBE   |
    INC $76,x           ; $04CFC1   |
    LDA #$0160          ; $04CFC3   |

CODE_04CFC6:
    STA $7A38,x         ; $04CFC6   |
    RTS                 ; $04CFC9   |

    TYX                 ; $04CFCA   |
    LDA $7A38,x         ; $04CFCB   |
    CLC                 ; $04CFCE   |
    ADC #$0008          ; $04CFCF   |
    AND #$01FE          ; $04CFD2   |
    STA $7A38,x         ; $04CFD5   |
    RTS                 ; $04CFD8   |

DATA_04CFD9:         dw $FFC0, $0040

.init_milde
    LDA $7900,x         ; $04CFDD   |
    BEQ CODE_04CFE5     ; $04CFE0   |
    STA $7040,x         ; $04CFE2   |

CODE_04CFE5:
    LDY $7400,x         ; $04CFE5   |
    LDA $CFD9,y         ; $04CFE8   |
    STA $7220,x         ; $04CFEB   |
    INC $16,x           ; $04CFEE   |
    RTL                 ; $04CFF0   |

DATA_04CFF1:         dw $0941, $0841

DATA_04CFF5:         dw $D0D4
DATA_04CFF7:         dw $D104

.main_milde
    LDY #$00            ; $04CFF9   |
    LDA $7D38,x         ; $04CFFB   |
    BEQ CODE_04D002     ; $04CFFE   |
    INY                 ; $04D000   |
    INY                 ; $04D001   |

CODE_04D002:
    LDA $CFF1,y         ; $04D002   |
    STA $6FA2,x         ; $04D005   |
    LDA $6F00,x         ; $04D008   |
    CMP #$0010          ; $04D00B   |
    BEQ CODE_04D022     ; $04D00E   |
    LDA $60AC           ; $04D010   |
    CMP #$0002          ; $04D013   |
    BNE CODE_04D022     ; $04D016   |
    CMP $18,x           ; $04D018   |
    BNE CODE_04D022     ; $04D01A   |
    LDA #$0000          ; $04D01C   |
    STA $60AC           ; $04D01F   |

CODE_04D022:
    LDA $6F00,x         ; $04D022   |
    CMP #$0010          ; $04D025   |
    BEQ CODE_04D037     ; $04D028   |
    CMP #$0008          ; $04D02A   |
    BEQ CODE_04D037     ; $04D02D   |
    LDY $78,x           ; $04D02F   |
    BNE CODE_04D037     ; $04D031   |
    JSL $04D1A0         ; $04D033   |

CODE_04D037:
    JSL $03AF23         ; $04D037   |
    LDY $76,x           ; $04D03B   |
    BEQ CODE_04D042     ; $04D03D   |
    JMP CODE_04D0CB     ; $04D03F   |

CODE_04D042:
    LDA $7860,x         ; $04D042   |
    AND #$0001          ; $04D045   |
    BEQ CODE_04D053     ; $04D048   |
    LDY $7400,x         ; $04D04A   |
    LDA $CFD9,y         ; $04D04D   |
    STA $7220,x         ; $04D050   |

CODE_04D053:
    LDY $7D36,x         ; $04D053   |
    BPL CODE_04D0C5     ; $04D056   |
    LDA $7C18,x         ; $04D058   |
    SEC                 ; $04D05B   |
    SBC $6122           ; $04D05C   |
    SEC                 ; $04D05F   |
    SBC $7BB8,x         ; $04D060   |
    CMP #$FFF8          ; $04D063   |
    BCC CODE_04D0BF     ; $04D066   |
    LDY $60AB           ; $04D068   |
    BMI CODE_04D0CB     ; $04D06B   |
    LDY $60C0           ; $04D06D   |
    BEQ CODE_04D0BF     ; $04D070   |
    LDA $7860,x         ; $04D072   |
    AND #$0001          ; $04D075   |
    BEQ CODE_04D0CB     ; $04D078   |
    LDA #$0020          ; $04D07A   |
    CMP $61D6           ; $04D07D   |
    BMI CODE_04D085     ; $04D080   |
    STA $61D6           ; $04D082   |

CODE_04D085:
    LDA $6086           ; $04D085   |
    AND $0035           ; $04D088   |
    STA $617A           ; $04D08B   |
    STZ $60D4           ; $04D08E   |
    LDA #$0002          ; $04D091   |
    STA $60AC           ; $04D094   |
    STA $18,x           ; $04D097   |
    LDA #$7C60          ; $04D099   |
    STA $6FA0,x         ; $04D09C   |
    STZ $7220,x         ; $04D09F   |
    STZ $60A8           ; $04D0A2   |
    STZ $60B4           ; $04D0A5   |
    STZ $60AA           ; $04D0A8   |
    LDA #$1175          ; $04D0AB   |
    STA $7040,x         ; $04D0AE   |
    LDA #$000A          ; $04D0B1   |
    STA $7402,x         ; $04D0B4   |
    DEC A               ; $04D0B7   |
    STA $7A98,x         ; $04D0B8   |
    INC $76,x           ; $04D0BB   |
    BRA CODE_04D0CB     ; $04D0BD   |

CODE_04D0BF:
    JSL $03A813         ; $04D0BF   |
    BRA CODE_04D0CB     ; $04D0C3   |

CODE_04D0C5:
    JSL $0DC0F0         ; $04D0C5   |
    BCS CODE_04D0D3     ; $04D0C9   |

CODE_04D0CB:
    TXY                 ; $04D0CB   |
    LDA $76,x           ; $04D0CC   |
    ASL A               ; $04D0CE   |
    TAX                 ; $04D0CF   |
    JSR ($CFF5,x)       ; $04D0D0   |

CODE_04D0D3:
    RTL                 ; $04D0D3   |

    TYX                 ; $04D0D4   |
    LDA $7A98,x         ; $04D0D5   |
    BNE CODE_04D0FF     ; $04D0D8   |
    LDA #$0006          ; $04D0DA   |
    STA $7A98,x         ; $04D0DD   |
    LDA $16,x           ; $04D0E0   |
    CLC                 ; $04D0E2   |
    ADC $7402,x         ; $04D0E3   |
    BPL CODE_04D0EF     ; $04D0E6   |
    LDA #$0001          ; $04D0E8   |
    STA $16,x           ; $04D0EB   |
    BRA CODE_04D0FC     ; $04D0ED   |

CODE_04D0EF:
    CMP #$0005          ; $04D0EF   |
    BNE CODE_04D0FC     ; $04D0F2   |
    LDA #$FFFF          ; $04D0F4   |
    STA $16,x           ; $04D0F7   |
    LDA #$0003          ; $04D0F9   |

CODE_04D0FC:
    STA $7402,x         ; $04D0FC   |

CODE_04D0FF:
    RTS                 ; $04D0FF   |

DATA_04D100:         dw $0018, $0014

    TYX                 ; $04D104   |
    LDA $7A98,x         ; $04D105   |
    BNE CODE_04D17E     ; $04D108   |
    LDY $7402,x         ; $04D10A   |
    CPY #$0B            ; $04D10D   |
    BNE CODE_04D175     ; $04D10F   |
    LDA #$01EE          ; $04D111   |
    JSL $008B21         ; $04D114   |
    LDA $7CD6,x         ; $04D118   |
    STA $70A2,y         ; $04D11B   |
    LDA $7CD8,x         ; $04D11E   |
    STA $7142,y         ; $04D121   |
    LDA #$0002          ; $04D124   |
    STA $7782,y         ; $04D127   |
    LDA #$0008          ; $04D12A   |
    STA $73C2,y         ; $04D12D   |
    LDA #$003B          ; $04D130   |\ play sound #$003B
    JSL $0085D2         ; $04D133   |/
    LDA #$0000          ; $04D137   |
    STA $60AC           ; $04D13A   |
    STZ $617A           ; $04D13D   |
    STZ $617C           ; $04D140   |
    JSL $04D1A0         ; $04D143   |
    LDA $7CD6,x         ; $04D147   |
    STA $3002           ; $04D14A   |
    LDA $7CD8,x         ; $04D14D   |
    STA $3004           ; $04D150   |
    LDA #$0040          ; $04D153   |
    STA $3014           ; $04D156   |
    LDA #$0200          ; $04D159   |
    STA $6000           ; $04D15C   |
    LDA #$FE00          ; $04D15F   |
    STA $6002           ; $04D162   |
    LDX #$09            ; $04D165   |
    LDA #$9253          ; $04D167   |
    JSL $7EDE44         ; $04D16A   | GSU init
    LDX $12             ; $04D16E   |
    JSL $03A32E         ; $04D170   |
    RTS                 ; $04D174   |

CODE_04D175:
    INC $7402,x         ; $04D175   |
    LDA #$0004          ; $04D178   |
    STA $7A98,x         ; $04D17B   |

CODE_04D17E:
    LDA $60FC           ; $04D17E   |
    AND #$0007          ; $04D181   |
    BNE CODE_04D19F     ; $04D184   |
    LDA $7402,x         ; $04D186   |
    ASL A               ; $04D189   |
    TAY                 ; $04D18A   |
    LDA $7182,x         ; $04D18B   |
    SEC                 ; $04D18E   |
    SBC $D0EC,y         ; $04D18F   |
    SEC                 ; $04D192   |
    SBC $6112           ; $04D193   |
    STA $6090           ; $04D196   |
    STZ $60AA           ; $04D199   |
    INC $61B4           ; $04D19C   |

CODE_04D19F:
    RTS                 ; $04D19F   |

    INC $78,x           ; $04D1A0   |
    INC $1013           ; $04D1A2   |
    BNE CODE_04D1B5     ; $04D1A5   |
    LDA $70E2,x         ; $04D1A7   |
    STA $00             ; $04D1AA   |
    LDA $7182,x         ; $04D1AC   |
    STA $02             ; $04D1AF   |
    JSL $02E19C         ; $04D1B1   |

CODE_04D1B5:
    RTL                 ; $04D1B5   |

    LDA $7360,x         ; $04D1B6   |
    CMP #$0108          ; $04D1B9   |
    BNE CODE_04D1C2     ; $04D1BC   |
    JSL $04D1A0         ; $04D1BE   |

CODE_04D1C2:
    RTL                 ; $04D1C2   |

.init_mace_guy
    LDA #$009C          ; $04D1C3   |
    JSL $03A34C         ; $04D1C6   |
    BCC CODE_04D1D5     ; $04D1CA   |
    STY $18,x           ; $04D1CC   |
    TYX                 ; $04D1CE   |
    JSL $03AD74         ; $04D1CF   |
    BCS CODE_04D1DB     ; $04D1D3   |

CODE_04D1D5:
    LDX $12             ; $04D1D5   |
    JMP CODE_0403A3     ; $04D1D7   |

CODE_04D1DB:
    LDX $12             ; $04D1DB   |
    LDY $18,x           ; $04D1DD   |
    LDA $70E2,x         ; $04D1DF   |
    STA $70E2,y         ; $04D1E2   |
    LDA $7182,x         ; $04D1E5   |
    SEC                 ; $04D1E8   |
    SBC #$0010          ; $04D1E9   |
    STA $7182,y         ; $04D1EC   |
    LDA #$0100          ; $04D1EF   |
    STA $7A36,y         ; $04D1F2   |
    TXA                 ; $04D1F5   |
    STA $7978,y         ; $04D1F6   |
    LDA #$FFC0          ; $04D1F9   |
    STA $7222,y         ; $04D1FC   |
    LDA #$0005          ; $04D1FF   |
    STA $7902,y         ; $04D202   |
    LDA $7400,x         ; $04D205   |
    STA $7400,y         ; $04D208   |
    RTL                 ; $04D20B   |

.main_mace_guy
    JSL $03A2C7         ; $04D20C   |
    BCC CODE_04D223     ; $04D210   |
    LDY $18,x           ; $04D212   |
    TYX                 ; $04D214   |
    JSL $03A2DE         ; $04D215   |
    BCC CODE_04D221     ; $04D219   |
    LDX $12             ; $04D21B   |
    JMP CODE_0403A3     ; $04D21D   |

CODE_04D221:
    LDX $12             ; $04D221   |

CODE_04D223:
    LDA $7D96,x         ; $04D223   |
    BNE CODE_04D230     ; $04D226   |
    LDA $6F00,x         ; $04D228   |
    CMP #$0008          ; $04D22B   |
    BNE CODE_04D233     ; $04D22E   |

CODE_04D230:
    JSR CODE_04D27E     ; $04D230   |

CODE_04D233:
    JSL $03AF23         ; $04D233   |
    STZ $7402,x         ; $04D237   |
    LDY $18,x           ; $04D23A   |
    LDA $7A38,y         ; $04D23C   |
    SEC                 ; $04D23F   |
    SBC #$0010          ; $04D240   |
    AND #$01FE          ; $04D243   |
    CMP #$0080          ; $04D246   |
    BMI CODE_04D25E     ; $04D249   |
    INC $7402,x         ; $04D24B   |
    CMP #$0100          ; $04D24E   |
    BMI CODE_04D25E     ; $04D251   |
    INC $7402,x         ; $04D253   |
    CMP #$0180          ; $04D256   |
    BMI CODE_04D25E     ; $04D259   |
    INC $7402,x         ; $04D25B   |

CODE_04D25E:
    LDY $7D36,x         ; $04D25E   |
    DEY                 ; $04D261   |
    BMI CODE_04D279     ; $04D262   |
    LDA $6F00,y         ; $04D264   |
    CMP #$0010          ; $04D267   |
    BNE CODE_04D27D     ; $04D26A   |
    LDA $7D38,y         ; $04D26C   |
    BEQ CODE_04D27D     ; $04D26F   |
    JSR CODE_04D27E     ; $04D271   |
    JSL $048BDB         ; $04D274   |
    RTL                 ; $04D278   |

CODE_04D279:
    JSL $03A5B7         ; $04D279   |

CODE_04D27D:
    RTL                 ; $04D27D   |

CODE_04D27E:
    PHY                 ; $04D27E   |
    LDA $7D96,x         ; $04D27F   |
    PHA                 ; $04D282   |
    LDA $7220,x         ; $04D283   |
    PHA                 ; $04D286   |
    LDA $7042,x         ; $04D287   |
    PHA                 ; $04D28A   |
    TXY                 ; $04D28B   |
    LDA #$001E          ; $04D28C   |
    JSL $03A377         ; $04D28F   |
    PLA                 ; $04D293   |
    STA $7042,x         ; $04D294   |
    INC A               ; $04D297   |
    STA $7902,x         ; $04D298   |
    PLA                 ; $04D29B   |
    STA $7220,x         ; $04D29C   |
    PLA                 ; $04D29F   |
    STA $7D96,x         ; $04D2A0   |
    PLY                 ; $04D2A3   |
    RTS                 ; $04D2A4   |

.init_mace
    JSR CODE_04D4E7     ; $04D2A5   |
    RTL                 ; $04D2A8   |

DATA_04D2A9:         dw $D53B
DATA_04D2AB:         dw $D57E

DATA_04D2AD:         dw $0006, $0001

.main_mace
    LDY $18,x           ; $04D2B1   |
    BEQ CODE_04D330     ; $04D2B3   |
    LDA $7360,y         ; $04D2B5   |
    CMP #$009B          ; $04D2B8   |
    BNE CODE_04D2CA     ; $04D2BB   |
    LDA $7D96,y         ; $04D2BD   |
    BNE CODE_04D2CA     ; $04D2C0   |
    LDA $6F00,y         ; $04D2C2   |
    CMP #$0010          ; $04D2C5   |
    BEQ CODE_04D31D     ; $04D2C8   |

CODE_04D2CA:
    LDA #$0100          ; $04D2CA   |
    SEC                 ; $04D2CD   |
    SBC $7A38,x         ; $04D2CE   |
    BPL CODE_04D2D7     ; $04D2D1   |
    EOR #$FFFF          ; $04D2D3   |
    INC A               ; $04D2D6   |

CODE_04D2D7:
    ASL A               ; $04D2D7   |
    STA $3000           ; $04D2D8   |
    LDA #$0200          ; $04D2DB   |
    STA $300C           ; $04D2DE   |
    LDX #$0B            ; $04D2E1   |
    LDA #$86B6          ; $04D2E3   |
    JSL $7EDE44         ; $04D2E6   | GSU init
    LDX $12             ; $04D2EA   |
    LDA $3000           ; $04D2EC   |
    LDY $7A39,x         ; $04D2EF   |
    BNE CODE_04D2F8     ; $04D2F2   |
    EOR #$FFFF          ; $04D2F4   |
    INC A               ; $04D2F7   |

CODE_04D2F8:
    LDY $7400,x         ; $04D2F8   |
    BEQ CODE_04D301     ; $04D2FB   |
    EOR #$FFFF          ; $04D2FD   |
    INC A               ; $04D300   |

CODE_04D301:
    STA $7220,x         ; $04D301   |
    LDA #$FF00          ; $04D304   |
    STA $7222,x         ; $04D307   |
    LDA #$0040          ; $04D30A   |
    STA $7542,x         ; $04D30D   |
    STZ $18,x           ; $04D310   |
    LDA $7040,x         ; $04D312   |
    ORA #$0008          ; $04D315   |
    STA $7040,x         ; $04D318   |
    BRA CODE_04D330     ; $04D31B   |

CODE_04D31D:
    LDA $70E2,y         ; $04D31D   |
    SEC                 ; $04D320   |
    SBC $70E2,x         ; $04D321   |
    STA $16,x           ; $04D324   |
    LDA $7182,y         ; $04D326   |
    SEC                 ; $04D329   |
    SBC $7182,x         ; $04D32A   |
    STA $75E0,x         ; $04D32D   |

CODE_04D330:
    JSR CODE_04D3DA     ; $04D330   |
    JSL $03AF23         ; $04D333   |
    LDY $18,x           ; $04D337   |
    BEQ CODE_04D387     ; $04D339   |
    LDA $7182,x         ; $04D33B   |
    CLC                 ; $04D33E   |
    ADC #$0010          ; $04D33F   |
    CMP $7182,y         ; $04D342   |
    BPL CODE_04D34A     ; $04D345   |
    STZ $7222,x         ; $04D347   |

CODE_04D34A:
    LDY #$10            ; $04D34A   |
    LDA $7900,x         ; $04D34C   |
    CMP #$6000          ; $04D34F   |
    BNE CODE_04D356     ; $04D352   |
    LDY #$08            ; $04D354   |

CODE_04D356:
    TYA                 ; $04D356   |
    CLC                 ; $04D357   |
    ADC $7A38,x         ; $04D358   |
    AND #$01FE          ; $04D35B   |
    STA $7A38,x         ; $04D35E   |
    TXY                 ; $04D361   |
    LDA $76,x           ; $04D362   |
    ASL A               ; $04D364   |
    TAX                 ; $04D365   |
    JSR ($D2A9,x)       ; $04D366   |

    LDA $7A38,x         ; $04D369   |
    STA $78,x           ; $04D36C   |
    LDY #$00            ; $04D36E   |
    LDA $7A38,x         ; $04D370   |
    SEC                 ; $04D373   |
    SBC #$0080          ; $04D374   |
    AND #$01FE          ; $04D377   |
    CMP #$0100          ; $04D37A   |
    BMI CODE_04D381     ; $04D37D   |
    LDY #$02            ; $04D37F   |

CODE_04D381:
    LDA $D2AD,y         ; $04D381   |
    STA $74A2,x         ; $04D384   |

CODE_04D387:
    JSR CODE_04D4E7     ; $04D387   |
    LDA $7CD6,x         ; $04D38A   |
    SEC                 ; $04D38D   |
    SBC $611C           ; $04D38E   |
    CLC                 ; $04D391   |
    ADC $6024           ; $04D392   |
    CMP $6026           ; $04D395   |
    BCS CODE_04D3D1     ; $04D398   |
    LDA $7CD8,x         ; $04D39A   |
    SEC                 ; $04D39D   |
    SBC $611E           ; $04D39E   |
    CLC                 ; $04D3A1   |
    ADC $6028           ; $04D3A2   |
    CMP $602A           ; $04D3A5   |
    BCS CODE_04D3D1     ; $04D3A8   |
    LDA $61D6           ; $04D3AA   |
    BNE CODE_04D3D1     ; $04D3AD   |
    LDA $7220,x         ; $04D3AF   |
    STA $60A8           ; $04D3B2   |
    STA $60B4           ; $04D3B5   |
    LDA #$FF00          ; $04D3B8   |
    STA $60AA           ; $04D3BB   |
    LDA #$0006          ; $04D3BE   |
    STA $60C0           ; $04D3C1   |
    LDA #$8001          ; $04D3C4   |
    STA $60D2           ; $04D3C7   |
    STZ $60D4           ; $04D3CA   |
    JSL $03A858         ; $04D3CD   |

CODE_04D3D1:
    RTL                 ; $04D3D1   |

DATA_04D3D2:         dw $FFF8, $0008

DATA_04D3D6:         dw $0010, $FFF0

CODE_04D3DA:
    LDY $18,x           ; $04D3DA   |
    BNE CODE_04D3EF     ; $04D3DC   |
    LDA $16,x           ; $04D3DE   |
    CMP #$8000          ; $04D3E0   |
    ROR A               ; $04D3E3   |
    CMP #$8000          ; $04D3E4   |
    ROR A               ; $04D3E7   |
    STA $00             ; $04D3E8   |
    LDA $75E0,x         ; $04D3EA   |
    BRA CODE_04D407     ; $04D3ED   |

CODE_04D3EF:
    LDA $70E2,y         ; $04D3EF   |
    SEC                 ; $04D3F2   |
    SBC $70E2,x         ; $04D3F3   |
    CMP #$8000          ; $04D3F6   |
    ROR A               ; $04D3F9   |
    CMP #$8000          ; $04D3FA   |
    ROR A               ; $04D3FD   |
    STA $00             ; $04D3FE   |
    LDA $7182,y         ; $04D400   |
    SEC                 ; $04D403   |
    SBC $7182,x         ; $04D404   |

CODE_04D407:
    CLC                 ; $04D407   |
    ADC #$0004          ; $04D408   |
    CMP #$8000          ; $04D40B   |
    ROR A               ; $04D40E   |
    CMP #$8000          ; $04D40F   |
    ROR A               ; $04D412   |
    STA $02             ; $04D413   |
    LDA $7680,x         ; $04D415   |
    CLC                 ; $04D418   |
    ADC #$0008          ; $04D419   |
    STA $04             ; $04D41C   |
    LDA $7682,x         ; $04D41E   |
    CLC                 ; $04D421   |
    ADC #$0004          ; $04D422   |
    STA $06             ; $04D425   |
    LDA #$0003          ; $04D427   |
    STA $0C             ; $04D42A   |
    LDA #$0008          ; $04D42C   |
    STA $0E             ; $04D42F   |
    REP #$10            ; $04D431   |
    LDY $7362,x         ; $04D433   |
    LDA $7A38,x         ; $04D436   |
    SEC                 ; $04D439   |
    SBC #$0080          ; $04D43A   |
    AND #$01FE          ; $04D43D   |
    CMP #$0100          ; $04D440   |
    BMI CODE_04D44C     ; $04D443   |
    TYA                 ; $04D445   |
    CLC                 ; $04D446   |
    ADC #$0020          ; $04D447   |
    BRA CODE_04D45B     ; $04D44A   |

CODE_04D44C:
    LDA #$FFF8          ; $04D44C   |
    STA $0E             ; $04D44F   |
    TYA                 ; $04D451   |
    CLC                 ; $04D452   |
    ADC #$0018          ; $04D453   |
    TAY                 ; $04D456   |
    SEC                 ; $04D457   |
    SBC #$0008          ; $04D458   |

CODE_04D45B:
    PHY                 ; $04D45B   |
    STA $3002           ; $04D45C   |
    JSL $03AA60         ; $04D45F   |
    REP #$10            ; $04D463   |
    LDY $7400,x         ; $04D465   |
    LDA $D3D2,y         ; $04D468   |
    STA $08             ; $04D46B   |
    LDA $D3D6,y         ; $04D46D   |
    STA $0A             ; $04D470   |
    PLY                 ; $04D472   |
    LDA $7680,x         ; $04D473   |
    CLC                 ; $04D476   |
    ADC $08             ; $04D477   |
    STA $6000,y         ; $04D479   |
    STA $6010,y         ; $04D47C   |
    CLC                 ; $04D47F   |
    ADC $0A             ; $04D480   |
    STA $6008,y         ; $04D482   |
    STA $6018,y         ; $04D485   |
    LDA $7682,x         ; $04D488   |
    SEC                 ; $04D48B   |
    SBC #$0008          ; $04D48C   |
    STA $6002,y         ; $04D48F   |
    STA $600A,y         ; $04D492   |
    CLC                 ; $04D495   |
    ADC #$0010          ; $04D496   |
    STA $6012,y         ; $04D499   |
    STA $601A,y         ; $04D49C   |
    LDA #$0002          ; $04D49F   |
    STA $6006,y         ; $04D4A2   |
    STA $600E,y         ; $04D4A5   |
    STA $6016,y         ; $04D4A8   |
    STA $601E,y         ; $04D4AB   |
    STZ $08             ; $04D4AE   |
    STZ $0A             ; $04D4B0   |
    LDY $3002           ; $04D4B2   |

CODE_04D4B5:
    LDA $08             ; $04D4B5   |
    CLC                 ; $04D4B7   |
    ADC $00             ; $04D4B8   |
    STA $08             ; $04D4BA   |
    CLC                 ; $04D4BC   |
    ADC $04             ; $04D4BD   |
    STA $6000,y         ; $04D4BF   |
    LDA $0A             ; $04D4C2   |
    CLC                 ; $04D4C4   |
    ADC $02             ; $04D4C5   |
    STA $0A             ; $04D4C7   |
    CLC                 ; $04D4C9   |
    ADC $06             ; $04D4CA   |
    STA $6002,y         ; $04D4CC   |
    LDA #$20BD          ; $04D4CF   |
    STA $6004,y         ; $04D4D2   |
    LDA #$0000          ; $04D4D5   |
    STA $6006,y         ; $04D4D8   |
    TYA                 ; $04D4DB   |
    CLC                 ; $04D4DC   |
    ADC $0E             ; $04D4DD   |
    TAY                 ; $04D4DF   |
    DEC $0C             ; $04D4E0   |
    BNE CODE_04D4B5     ; $04D4E2   |
    SEP #$10            ; $04D4E4   |
    RTS                 ; $04D4E6   |

CODE_04D4E7:
    LDA #$6000          ; $04D4E7   |
    STA $3018           ; $04D4EA   |
    LDA #$0054          ; $04D4ED   |
    STA $301A           ; $04D4F0   |
    STZ $300A           ; $04D4F3   |
    LDA $7A36,x         ; $04D4F6   |
    STA $3008           ; $04D4F9   |
    LDA #$0A00          ; $04D4FC   |
    STA $300C           ; $04D4FF   |
    LDA #$0600          ; $04D502   |
    STA $3014           ; $04D505   |
    LDA $6120           ; $04D508   |
    STA $3002           ; $04D50B   |
    LDA $6122           ; $04D50E   |
    STA $3010           ; $04D511   |
    LDA $7400,x         ; $04D514   |
    STA $300E           ; $04D517   |
    LDY $7722,x         ; $04D51A   |
    TYX                 ; $04D51D   |
    LDA $03A9CE,x       ; $04D51E   |
    STA $3006           ; $04D522   |
    LDA $03A9EE,x       ; $04D525   |
    STA $3004           ; $04D529   |
    LDX #$08            ; $04D52C   |
    LDA #$D69F          ; $04D52E   |
    JSL $7EDE44         ; $04D531   | GSU init
    LDX $12             ; $04D535   |
    INC $0CF9           ; $04D537   |
    RTS                 ; $04D53A   |

    TYX                 ; $04D53B   |
    LDA $7900,x         ; $04D53C   |
    CLC                 ; $04D53F   |
    ADC #$0060          ; $04D540   |
    CMP #$2001          ; $04D543   |
    BPL CODE_04D54B     ; $04D546   |
    STA $7900,x         ; $04D548   |

CODE_04D54B:
    JSR CODE_04D5AD     ; $04D54B   |
    LDA $3000           ; $04D54E   |
    ASL A               ; $04D551   |
    XBA                 ; $04D552   |
    AND #$00FF          ; $04D553   |
    CMP #$0080          ; $04D556   |
    BMI CODE_04D560     ; $04D559   |
    ORA #$FF00          ; $04D55B   |
    BRA CODE_04D562     ; $04D55E   |

CODE_04D560:
    ASL A               ; $04D560   |
    ASL A               ; $04D561   |

CODE_04D562:
    CLC                 ; $04D562   |
    ADC #$0100          ; $04D563   |
    STA $7A36,x         ; $04D566   |
    LDA $7A38,x         ; $04D569   |
    CMP $78,x           ; $04D56C   |
    BPL CODE_04D57D     ; $04D56E   |
    DEC $7902,x         ; $04D570   |
    BNE CODE_04D57D     ; $04D573   |
    LDA #$6000          ; $04D575   |
    STA $7900,x         ; $04D578   |
    INC $76,x           ; $04D57B   |

CODE_04D57D:
    RTS                 ; $04D57D   |

    TYX                 ; $04D57E   |
    LDA $7A38,x         ; $04D57F   |
    CMP #$0100          ; $04D582   |
    BNE CODE_04D595     ; $04D585   |
    LDA #$1FE0          ; $04D587   |
    STA $7900,x         ; $04D58A   |
    LDA #$0005          ; $04D58D   |
    STA $7902,x         ; $04D590   |
    DEC $76,x           ; $04D593   |

CODE_04D595:
    JSR CODE_04D5AD     ; $04D595   |
    LDY $7A38,x         ; $04D598   |
    BPL CODE_04D5AC     ; $04D59B   |
    LDA $7A36,x         ; $04D59D   |
    SEC                 ; $04D5A0   |
    SBC #$0010          ; $04D5A1   |
    CMP #$00C0          ; $04D5A4   |
    BMI CODE_04D5AC     ; $04D5A7   |
    STA $7A36,x         ; $04D5A9   |

CODE_04D5AC:
    RTS                 ; $04D5AC   |

CODE_04D5AD:
    LDA $7A38,x         ; $04D5AD   |
    LDY $7400,x         ; $04D5B0   |
    BEQ CODE_04D5BC     ; $04D5B3   |
    EOR #$FFFF          ; $04D5B5   |
    INC A               ; $04D5B8   |
    AND #$01FE          ; $04D5B9   |

CODE_04D5BC:
    STA $3002           ; $04D5BC   |
    LDA $7900,x         ; $04D5BF   |
    STA $300C           ; $04D5C2   |
    LDX #$0B            ; $04D5C5   |
    LDA #$8595          ; $04D5C7   |
    JSL $7EDE44         ; $04D5CA   | GSU init
    LDX $12             ; $04D5CE   |
    LDY $18,x           ; $04D5D0   |
    LDA $3002           ; $04D5D2   |
    XBA                 ; $04D5D5   |
    AND #$00FF          ; $04D5D6   |
    CMP #$0080          ; $04D5D9   |
    BMI CODE_04D5E1     ; $04D5DC   |
    ORA #$FF00          ; $04D5DE   |

CODE_04D5E1:
    CLC                 ; $04D5E1   |
    ADC $70E2,y         ; $04D5E2   |
    STA $70E2,x         ; $04D5E5   |
    RTS                 ; $04D5E8   |

.init_4_toadies
    RTL                 ; $04D5E9   |

DATA_04D5EA:         dw $D86C
DATA_04D5EC:         dw $D97E
DATA_04D5EE:         dw $D9DC
DATA_04D5F0:         dw $DA0E
DATA_04D5F2:         dw $DA7C

DATA_04D5F4:         dw $FFC0, $0040, $FF00, $0100

.main_4_toadies
    JSR CODE_04D7EA     ; $04D5FC   |
    JSL $03AF23         ; $04D5FF   |
    LDA $0146           ; $04D603   |
    CMP #$0009          ; $04D606   |
    BNE CODE_04D64C     ; $04D609   |
    LDA $70E2,x         ; $04D60B   |
    SEC                 ; $04D60E   |
    SBC $609A           ; $04D60F   |
    CLC                 ; $04D612   |
    ADC $6094           ; $04D613   |
    STA $70E2,x         ; $04D616   |
    CLC                 ; $04D619   |
    ADC #$0008          ; $04D61A   |
    STA $7CD6,x         ; $04D61D   |
    LDA $7182,x         ; $04D620   |
    SEC                 ; $04D623   |
    SBC $60A2           ; $04D624   |
    CLC                 ; $04D627   |
    ADC $609C           ; $04D628   |
    STA $7182,x         ; $04D62B   |
    CLC                 ; $04D62E   |
    ADC #$0008          ; $04D62F   |
    STA $7CD8,x         ; $04D632   |
    LDY $76             ; $04D635   |
    CPY #$03            ; $04D637   |
    BNE CODE_04D64C     ; $04D639   |
    LDA $0DBC           ; $04D63B   |
    CLC                 ; $04D63E   |
    ADC $6094           ; $04D63F   |
    STA $70E2           ; $04D642   |
    CLC                 ; $04D645   |
    ADC #$0008          ; $04D646   |
    STA $7CD6           ; $04D649   |

CODE_04D64C:
    LDA $70E2,x         ; $04D64C   |
    STA $6000           ; $04D64F   |
    LDA $7182,x         ; $04D652   |
    STA $6002           ; $04D655   |
    LDA $7CD6,x         ; $04D658   |
    STA $6004           ; $04D65B   |
    LDA $7CD8,x         ; $04D65E   |
    STA $6006           ; $04D661   |
    LDY $0E2D           ; $04D664   |
    BNE CODE_04D6C0     ; $04D667   |
    LDA $61B2           ; $04D669   |
    BMI CODE_04D691     ; $04D66C   |
    LDA $0B59           ; $04D66E   |
    ORA $0B57           ; $04D671   |
    BNE CODE_04D67E     ; $04D674   |
    LDA $03B6           ; $04D676   |
    CMP #$000A          ; $04D679   |
    BMI CODE_04D689     ; $04D67C   |

CODE_04D67E:
    LDA $61CC           ; $04D67E   |
    BEQ CODE_04D691     ; $04D681   |
    JSL $06C09A         ; $04D683   |
    BRA CODE_04D691     ; $04D687   |

CODE_04D689:
    LDA $6F00           ; $04D689   |
    CMP #$0010          ; $04D68C   |
    BEQ CODE_04D6C0     ; $04D68F   |

CODE_04D691:
    INC $0E2D           ; $04D691   |
    STZ $61CC           ; $04D694   |
    LDX #$0C            ; $04D697   |

CODE_04D699:
    LDA #$0004          ; $04D699   |
    STA $0EC9,x         ; $04D69C   |
    TXA                 ; $04D69F   |
    LSR A               ; $04D6A0   |
    TAY                 ; $04D6A1   |
    LDA $D5F4,y         ; $04D6A2   |
    STA $0E69,x         ; $04D6A5   |
    LDA #$0200          ; $04D6A8   |
    STA $0E6B,x         ; $04D6AB   |
    LDA #$F800          ; $04D6AE   |
    STA $0E8B,x         ; $04D6B1   |
    LDA #$0010          ; $04D6B4   |
    STA $0E7B,x         ; $04D6B7   |
    DEX                 ; $04D6BA   |
    DEX                 ; $04D6BB   |
    DEX                 ; $04D6BC   |
    DEX                 ; $04D6BD   |
    BPL CODE_04D699     ; $04D6BE   |

CODE_04D6C0:
    LDX #$0C            ; $04D6C0   |

CODE_04D6C2:
    LDA $0E9B,x         ; $04D6C2   |
    BEQ CODE_04D6CA     ; $04D6C5   |
    JMP CODE_04D7A8     ; $04D6C7   |

CODE_04D6CA:
    LDA $0E69,x         ; $04D6CA   |
    CMP $0E89,x         ; $04D6CD   |
    BMI CODE_04D6D8     ; $04D6D0   |
    SEC                 ; $04D6D2   |
    SBC $0E79,x         ; $04D6D3   |
    BRA CODE_04D6DC     ; $04D6D6   |

CODE_04D6D8:
    CLC                 ; $04D6D8   |
    ADC $0E79,x         ; $04D6D9   |

CODE_04D6DC:
    STA $0E69,x         ; $04D6DC   |
    BPL CODE_04D6F0     ; $04D6DF   |
    CLC                 ; $04D6E1   |
    ADC $0E37,x         ; $04D6E2   |
    STA $0E37,x         ; $04D6E5   |
    LDA $0E39,x         ; $04D6E8   |
    SBC #$0000          ; $04D6EB   |
    BRA CODE_04D6FD     ; $04D6EE   |

CODE_04D6F0:
    CLC                 ; $04D6F0   |
    ADC $0E37,x         ; $04D6F1   |
    STA $0E37,x         ; $04D6F4   |
    LDA $0E39,x         ; $04D6F7   |
    ADC #$0000          ; $04D6FA   |

CODE_04D6FD:
    STA $0E39,x         ; $04D6FD   |
    LDA $6000           ; $04D700   |
    CLC                 ; $04D703   |
    ADC $0E38,x         ; $04D704   |
    STA $6020           ; $04D707   |
    LDA $6004           ; $04D70A   |
    CLC                 ; $04D70D   |
    ADC $0E38,x         ; $04D70E   |
    STA $6024           ; $04D711   |
    LDA $0E6B,x         ; $04D714   |
    CMP $0E8B,x         ; $04D717   |
    BMI CODE_04D722     ; $04D71A   |
    SEC                 ; $04D71C   |
    SBC $0E7B,x         ; $04D71D   |
    BRA CODE_04D726     ; $04D720   |

CODE_04D722:
    CLC                 ; $04D722   |
    ADC $0E7B,x         ; $04D723   |

CODE_04D726:
    STA $0E6B,x         ; $04D726   |
    BPL CODE_04D73A     ; $04D729   |
    CLC                 ; $04D72B   |
    ADC $0E49,x         ; $04D72C   |
    STA $0E49,x         ; $04D72F   |
    LDA $0E4B,x         ; $04D732   |
    SBC #$0000          ; $04D735   |
    BRA CODE_04D747     ; $04D738   |

CODE_04D73A:
    CLC                 ; $04D73A   |
    ADC $0E49,x         ; $04D73B   |
    STA $0E49,x         ; $04D73E   |
    LDA $0E4B,x         ; $04D741   |
    ADC #$0000          ; $04D744   |

CODE_04D747:
    STA $0E4B,x         ; $04D747   |
    LDA $6002           ; $04D74A   |
    CLC                 ; $04D74D   |
    ADC $0E4A,x         ; $04D74E   |
    STA $6022           ; $04D751   |
    LDA $6006           ; $04D754   |
    CLC                 ; $04D757   |
    ADC $0E4A,x         ; $04D758   |
    STA $6026           ; $04D75B   |
    LDA $0EAB,x         ; $04D75E   |
    BEQ CODE_04D766     ; $04D761   |
    DEC $0EAB,x         ; $04D763   |

CODE_04D766:
    LDA $0EB9,x         ; $04D766   |
    BEQ CODE_04D76E     ; $04D769   |
    DEC $0EB9,x         ; $04D76B   |

CODE_04D76E:
    LDA $0EBB,x         ; $04D76E   |
    BEQ CODE_04D776     ; $04D771   |
    DEC $0EBB,x         ; $04D773   |

CODE_04D776:
    TXY                 ; $04D776   |
    LDA $0EC9,x         ; $04D777   |
    ASL A               ; $04D77A   |
    TAX                 ; $04D77B   |
    JSR ($D5EA,x)       ; $04D77C   |

    LDA $0EB9,x         ; $04D77F   |
    BNE CODE_04D794     ; $04D782   |
    LDA #$0006          ; $04D784   |
    STA $0EB9,x         ; $04D787   |
    LDA $0EA9,x         ; $04D78A   |
    INC A               ; $04D78D   |
    AND #$0003          ; $04D78E   |
    STA $0EA9,x         ; $04D791   |

CODE_04D794:
    LDA $6020           ; $04D794   |
    SEC                 ; $04D797   |
    SBC $6000           ; $04D798   |
    STA $0E38,x         ; $04D79B   |
    LDA $6022           ; $04D79E   |
    SEC                 ; $04D7A1   |
    SBC $6002           ; $04D7A2   |
    STA $0E4A,x         ; $04D7A5   |

CODE_04D7A8:
    DEX                 ; $04D7A8   |
    DEX                 ; $04D7A9   |
    DEX                 ; $04D7AA   |
    DEX                 ; $04D7AB   |
    BMI CODE_04D7B1     ; $04D7AC   |
    JMP CODE_04D6C2     ; $04D7AE   |

CODE_04D7B1:
    LDX $12             ; $04D7B1   |
    LDA $0146           ; $04D7B3   |
    CMP #$0009          ; $04D7B6   |
    BNE CODE_04D7E5     ; $04D7B9   |
    LDA $70E2,x         ; $04D7BB   |
    SEC                 ; $04D7BE   |
    SBC $6094           ; $04D7BF   |
    CLC                 ; $04D7C2   |
    ADC $609A           ; $04D7C3   |
    STA $70E2,x         ; $04D7C6   |
    CLC                 ; $04D7C9   |
    ADC #$0008          ; $04D7CA   |
    STA $7CD6,x         ; $04D7CD   |
    LDA $7182,x         ; $04D7D0   |
    SEC                 ; $04D7D3   |
    SBC $609C           ; $04D7D4   |
    CLC                 ; $04D7D7   |
    ADC $60A2           ; $04D7D8   |
    STA $7182,x         ; $04D7DB   |
    CLC                 ; $04D7DE   |
    ADC #$0008          ; $04D7DF   |
    STA $7CD8,x         ; $04D7E2   |

CODE_04D7E5:
    RTL                 ; $04D7E5   |

DATA_04D7E6:         db $2C, $2D, $3C, $3D

CODE_04D7EA:
    REP #$10            ; $04D7EA   |
    LDY $7362,x         ; $04D7EC   |
    LDX #$000C          ; $04D7EF   |

CODE_04D7F2:
    LDA $0E9B,x         ; $04D7F2   |
    BEQ CODE_04D805     ; $04D7F5   |
    LDA #$8000          ; $04D7F7   |
    STA $6000,y         ; $04D7FA   |
    STA $6008,y         ; $04D7FD   |
    STA $6010,y         ; $04D800   |
    BRA CODE_04D857     ; $04D803   |

CODE_04D805:
    LDA $6000,y         ; $04D805   |
    CLC                 ; $04D808   |
    ADC $0E38,x         ; $04D809   |
    STA $6000,y         ; $04D80C   |
    STA $6008,y         ; $04D80F   |
    CLC                 ; $04D812   |
    ADC #$0008          ; $04D813   |
    STA $6010,y         ; $04D816   |
    LDA $6002,y         ; $04D819   |
    CLC                 ; $04D81C   |
    ADC $0E4A,x         ; $04D81D   |
    STA $6002,y         ; $04D820   |
    SEC                 ; $04D823   |
    SBC #$0008          ; $04D824   |
    STA $600A,y         ; $04D827   |
    STA $6012,y         ; $04D82A   |
    LDA $0E99,x         ; $04D82D   |
    XBA                 ; $04D830   |
    LSR A               ; $04D831   |
    LSR A               ; $04D832   |
    LSR A               ; $04D833   |
    XBA                 ; $04D834   |
    STA $00             ; $04D835   |
    PHY                 ; $04D837   |
    LDY $0EA9,x         ; $04D838   |
    LDA $D7E6,y         ; $04D83B   |
    AND #$00FF          ; $04D83E   |
    PLY                 ; $04D841   |
    CLC                 ; $04D842   |
    ADC $600C,y         ; $04D843   |
    STA $600C,y         ; $04D846   |
    EOR #$4000          ; $04D849   |
    STA $6014,y         ; $04D84C   |
    LDA $6004,y         ; $04D84F   |
    EOR $00             ; $04D852   |
    STA $6004,y         ; $04D854   |

CODE_04D857:
    TYA                 ; $04D857   |
    CLC                 ; $04D858   |
    ADC #$0018          ; $04D859   |
    TAY                 ; $04D85C   |
    DEX                 ; $04D85D   |
    DEX                 ; $04D85E   |
    DEX                 ; $04D85F   |
    DEX                 ; $04D860   |
    BPL CODE_04D7F2     ; $04D861   |
    SEP #$10            ; $04D863   |
    LDX $12             ; $04D865   |
    RTS                 ; $04D867   |

DATA_04D868:         dw $0300, $FD00

    TYX                 ; $04D86C   |
    LDA #$0002          ; $04D86D   |
    STA $0E99,x         ; $04D870   |
    LDA $7CD6           ; $04D873   |
    SEC                 ; $04D876   |
    SBC $6024           ; $04D877   |
    PHP                 ; $04D87A   |
    BPL CODE_04D881     ; $04D87B   |
    EOR #$FFFF          ; $04D87D   |
    INC A               ; $04D880   |

CODE_04D881:
    LSR A               ; $04D881   |
    CMP #$0018          ; $04D882   |
    BMI CODE_04D88A     ; $04D885   |
    LDA #$0018          ; $04D887   |

CODE_04D88A:
    CLC                 ; $04D88A   |
    ADC #$0018          ; $04D88B   |
    STA $0E79,x         ; $04D88E   |
    ASL A               ; $04D891   |
    ASL A               ; $04D892   |
    ASL A               ; $04D893   |
    ASL A               ; $04D894   |
    PLP                 ; $04D895   |
    BPL CODE_04D89F     ; $04D896   |
    EOR #$FFFF          ; $04D898   |
    INC A               ; $04D89B   |
    STZ $0E99,x         ; $04D89C   |

CODE_04D89F:
    STA $0E89,x         ; $04D89F   |
    LDA $7CD8           ; $04D8A2   |
    SEC                 ; $04D8A5   |
    SBC $6026           ; $04D8A6   |
    PHP                 ; $04D8A9   |
    BPL CODE_04D8B0     ; $04D8AA   |
    EOR #$FFFF          ; $04D8AC   |
    INC A               ; $04D8AF   |

CODE_04D8B0:
    LSR A               ; $04D8B0   |
    CMP #$0018          ; $04D8B1   |
    BMI CODE_04D8B9     ; $04D8B4   |
    LDA #$0018          ; $04D8B6   |

CODE_04D8B9:
    CLC                 ; $04D8B9   |
    ADC #$0018          ; $04D8BA   |
    STA $0E7B,x         ; $04D8BD   |
    ASL A               ; $04D8C0   |
    ASL A               ; $04D8C1   |
    ASL A               ; $04D8C2   |
    ASL A               ; $04D8C3   |
    PLP                 ; $04D8C4   |
    BPL CODE_04D8CB     ; $04D8C5   |
    EOR #$FFFF          ; $04D8C7   |
    INC A               ; $04D8CA   |

CODE_04D8CB:
    STA $0E8B,x         ; $04D8CB   |
    LDA $7CD6           ; $04D8CE   |
    SEC                 ; $04D8D1   |
    SBC $6024           ; $04D8D2   |
    CLC                 ; $04D8D5   |
    ADC #$000C          ; $04D8D6   |
    CMP #$0018          ; $04D8D9   |
    BCC CODE_04D8DF     ; $04D8DC   |

CODE_04D8DE:
    RTS                 ; $04D8DE   |

CODE_04D8DF:
    LDA $7CD8           ; $04D8DF   |
    SEC                 ; $04D8E2   |
    SBC $6026           ; $04D8E3   |
    CLC                 ; $04D8E6   |
    ADC #$000C          ; $04D8E7   |
    CMP #$0018          ; $04D8EA   |
    BCS CODE_04D8DE     ; $04D8ED   |
    LDA $61CC           ; $04D8EF   |
    PHP                 ; $04D8F2   |
    AND #$0002          ; $04D8F3   |
    STA $0E99,x         ; $04D8F6   |
    PLP                 ; $04D8F9   |
    BNE CODE_04D938     ; $04D8FA   |
    LDA $0146           ; $04D8FC   |
    CMP #$0009          ; $04D8FF   |
    BNE CODE_04D91D     ; $04D902   |
    LDA $7680           ; $04D904   |
    STA $0DBC           ; $04D907   |
    STZ $7222           ; $04D90A   |
    STZ $75E2           ; $04D90D   |
    JSL $06BFA4         ; $04D910   |
    LDY #$07            ; $04D914   |
    STY $0DB4           ; $04D916   |
    LDY #$03            ; $04D919   |
    BRA CODE_04D936     ; $04D91B   |

CODE_04D91D:
    JSL $06C114         ; $04D91D   |
    JSL $06BF73         ; $04D921   |
    STZ $7220           ; $04D925   |
    STZ $7222           ; $04D928   |
    STZ $7542           ; $04D92B   |
    LDA #$6040          ; $04D92E   |
    STA $6FA2           ; $04D931   |
    LDY #$02            ; $04D934   |

CODE_04D936:
    STY $76             ; $04D936   |

CODE_04D938:
    LDY $61CC           ; $04D938   |
    CPY #$06            ; $04D93B   |
    BNE CODE_04D954     ; $04D93D   |
    LDA $7680           ; $04D93F   |
    AND #$FF00          ; $04D942   |
    STA $00             ; $04D945   |
    LDA $7682           ; $04D947   |
    AND #$FF00          ; $04D94A   |
    ORA $00             ; $04D94D   |
    BEQ CODE_04D954     ; $04D94F   |
    JMP CODE_04DA48     ; $04D951   |

CODE_04D954:
    TYA                 ; $04D954   |
    STA $0E59,x         ; $04D955   |
    INC $61CC           ; $04D958   |
    INC $61CC           ; $04D95B   |
    STZ $0E69,x         ; $04D95E   |
    STZ $0E79,x         ; $04D961   |
    STZ $0E6B,x         ; $04D964   |
    STZ $0E7B,x         ; $04D967   |
    INC $0EC9,x         ; $04D96A   |
    RTS                 ; $04D96D   |

DATA_04D96E:         dw $FFF6, $000A, $FFFA, $0006

DATA_04D976:         dw $0008, $0009, $0010, $000F

    TYX                 ; $04D97E   |
    LDY #$02            ; $04D97F   |
    STY $00             ; $04D981   |
    TXA                 ; $04D983   |
    LSR A               ; $04D984   |
    TAY                 ; $04D985   |
    LDA $70E2           ; $04D986   |
    CLC                 ; $04D989   |
    ADC $D96E,y         ; $04D98A   |
    STA $02             ; $04D98D   |
    LDA $6020           ; $04D98F   |
    SEC                 ; $04D992   |
    SBC $02             ; $04D993   |
    STA $04             ; $04D995   |
    INC A               ; $04D997   |
    CMP #$0002          ; $04D998   |
    BCS CODE_04D9A1     ; $04D99B   |
    STZ $04             ; $04D99D   |
    DEC $00             ; $04D99F   |

CODE_04D9A1:
    LDA $04             ; $04D9A1   |
    CMP #$8000          ; $04D9A3   |
    ROR A               ; $04D9A6   |
    CLC                 ; $04D9A7   |
    ADC $02             ; $04D9A8   |
    STA $6020           ; $04D9AA   |
    LDA $7182           ; $04D9AD   |
    CLC                 ; $04D9B0   |
    ADC $D976,y         ; $04D9B1   |
    STA $02             ; $04D9B4   |
    LDA $6022           ; $04D9B6   |
    SEC                 ; $04D9B9   |
    SBC $02             ; $04D9BA   |
    STA $04             ; $04D9BC   |
    INC A               ; $04D9BE   |
    CMP #$0002          ; $04D9BF   |
    BCS CODE_04D9C8     ; $04D9C2   |
    STZ $04             ; $04D9C4   |
    DEC $00             ; $04D9C6   |

CODE_04D9C8:
    LDA $04             ; $04D9C8   |
    CMP #$8000          ; $04D9CA   |
    ROR A               ; $04D9CD   |
    CLC                 ; $04D9CE   |
    ADC $02             ; $04D9CF   |
    STA $6022           ; $04D9D1   |
    LDY $00             ; $04D9D4   |
    BNE CODE_04D9DB     ; $04D9D6   |
    INC $0EC9,x         ; $04D9D8   |

CODE_04D9DB:
    RTS                 ; $04D9DB   |

    TYX                 ; $04D9DC   |
    LDY $61CC           ; $04D9DD   |
    CPY #$08            ; $04D9E0   |
    BMI CODE_04DA0D     ; $04D9E2   |
    LDY $0E2F           ; $04D9E4   |
    CPY #$04            ; $04D9E7   |
    BPL CODE_04DA02     ; $04D9E9   |
    LDY $0E5B,x         ; $04D9EB   |
    BNE CODE_04DA0D     ; $04D9EE   |
    INC $0E5B,x         ; $04D9F0   |
    INC $0E2F           ; $04D9F3   |
    LDY $0E59,x         ; $04D9F6   |
    BNE CODE_04DA0D     ; $04D9F9   |
    LDA #$003D          ; $04D9FB   |
    STA $0053           ; $04D9FE   |
    RTS                 ; $04DA01   |

CODE_04DA02:
    INC $0EC9,x         ; $04DA02   |
    TXA                 ; $04DA05   |
    LSR A               ; $04DA06   |
    AND #$0002          ; $04DA07   |
    STA $0E99,x         ; $04DA0A   |

CODE_04DA0D:
    RTS                 ; $04DA0D   |

    TYX                 ; $04DA0E   |
    TXA                 ; $04DA0F   |
    LSR A               ; $04DA10   |
    TAY                 ; $04DA11   |
    AND #$0002          ; $04DA12   |
    STA $0E99,x         ; $04DA15   |
    CPY #$06            ; $04DA18   |
    BNE CODE_04DA5F     ; $04DA1A   |
    LDA #$0040          ; $04DA1C   |
    STA $0E7B,x         ; $04DA1F   |
    LDA #$F800          ; $04DA22   |
    STA $0E8B,x         ; $04DA25   |
    LDA $6020           ; $04DA28   |
    SEC                 ; $04DA2B   |
    SBC #$0006          ; $04DA2C   |
    STA $70E2           ; $04DA2F   |
    LDA $6022           ; $04DA32   |
    SEC                 ; $04DA35   |
    SBC #$000F          ; $04DA36   |
    STA $7182           ; $04DA39   |
    LDA $6022           ; $04DA3C   |
    SEC                 ; $04DA3F   |
    SBC $609C           ; $04DA40   |
    CMP #$FFF0          ; $04DA43   |
    BPL CODE_04DA7B     ; $04DA46   |

CODE_04DA48:
    LDA $60AC           ; $04DA48   |
    CMP #$000E          ; $04DA4B   |
    BEQ CODE_04DA5E     ; $04DA4E   |
    REP #$10            ; $04DA50   |
    JSL $04F6F1         ; $04DA52   |
    LDA #$0012          ; $04DA56   |
    STA $0118           ; $04DA59   |
    SEP #$10            ; $04DA5C   |

CODE_04DA5E:
    RTS                 ; $04DA5E   |

CODE_04DA5F:
    LDA $6F00           ; $04DA5F   |
    CMP #$0010          ; $04DA62   |
    BNE CODE_04DA7B     ; $04DA65   |
    LDA $70E2           ; $04DA67   |
    CLC                 ; $04DA6A   |
    ADC $D96E,y         ; $04DA6B   |
    STA $6020           ; $04DA6E   |
    LDA $7182           ; $04DA71   |
    CLC                 ; $04DA74   |
    ADC $D976,y         ; $04DA75   |
    STA $6022           ; $04DA78   |

CODE_04DA7B:
    RTS                 ; $04DA7B   |

    TYX                 ; $04DA7C   |
    LDY $0E6C,x         ; $04DA7D   |
    BPL CODE_04DA88     ; $04DA80   |
    LDA #$0040          ; $04DA82   |
    STA $0E7B,x         ; $04DA85   |

CODE_04DA88:
    LDA $0146           ; $04DA88   |
    CMP #$0009          ; $04DA8B   |
    BEQ CODE_04DAA0     ; $04DA8E   |
    LDA $6020           ; $04DA90   |
    SEC                 ; $04DA93   |
    SBC $6094           ; $04DA94   |
    CLC                 ; $04DA97   |
    ADC #$0040          ; $04DA98   |
    CMP #$0180          ; $04DA9B   |
    BCS CODE_04DAB0     ; $04DA9E   |

CODE_04DAA0:
    LDA $6022           ; $04DAA0   |
    SEC                 ; $04DAA3   |
    SBC $609C           ; $04DAA4   |
    CLC                 ; $04DAA7   |
    ADC #$0040          ; $04DAA8   |
    CMP #$0160          ; $04DAAB   |
    BCC CODE_04DAC8     ; $04DAAE   |

CODE_04DAB0:
    INC $0E9B,x         ; $04DAB0   |
    DEC $0E31           ; $04DAB3   |
    BNE CODE_04DAE8     ; $04DAB6   |
    STZ $0E33           ; $04DAB8   |
    STZ $0E2D           ; $04DABB   |
    STZ $0CE6           ; $04DABE   |
    LDX $12             ; $04DAC1   |
    PLA                 ; $04DAC3   |
    JMP CODE_0403A3     ; $04DAC4   |

CODE_04DAC8:
    LDA $61B2           ; $04DAC8   |
    BMI CODE_04DAE8     ; $04DACB   |
    LDY $0E31           ; $04DACD   |
    CPY #$04            ; $04DAD0   |
    BNE CODE_04DAE8     ; $04DAD2   |
    LDA $03B6           ; $04DAD4   |
    CMP #$000A          ; $04DAD7   |
    BPL CODE_04DAE8     ; $04DADA   |
    STZ $0EC9,x         ; $04DADC   |
    STZ $0E2F           ; $04DADF   |
    STZ $0E2D           ; $04DAE2   |
    STZ $0E5B,x         ; $04DAE5   |

CODE_04DAE8:
    RTS                 ; $04DAE8   |

.init_spiky_mace_boo_guys
    LDA $70E2,x         ; $04DAE9   |
    AND #$0010          ; $04DAEC   |
    LSR A               ; $04DAEF   |
    LSR A               ; $04DAF0   |
    LSR A               ; $04DAF1   |
    STA $7400,x         ; $04DAF2   |
    RTL                 ; $04DAF5   |

.main_spiky_mace_boo_guys
    JSL $03AF23         ; $04DAF6   |
    LDA $7A98,x         ; $04DAFA   |
    BNE CODE_04DB14     ; $04DAFD   |
    LDA #$0008          ; $04DAFF   |
    STA $7A98,x         ; $04DB02   |
    LDA $7402,x         ; $04DB05   |
    INC A               ; $04DB08   |
    CMP #$0005          ; $04DB09   |
    BMI CODE_04DB11     ; $04DB0C   |
    LDA #$0000          ; $04DB0E   |

CODE_04DB11:
    STA $7402,x         ; $04DB11   |

CODE_04DB14:
    RTL                 ; $04DB14   |

DATA_04DB15:         dw $0020, $0040

.init_cloud
    SEP #$20            ; $04DB19   |
    LDA #$02            ; $04DB1B   |
    STA $74A1,x         ; $04DB1D   |
    REP #$20            ; $04DB20   |
    RTL                 ; $04DB22   |

DATA_04DB23:         dw $0030, $0040, $0050, $0060

.main_cloud
    JSL $03AF23         ; $04DB2B   |
    LDA $7680,x         ; $04DB2F   |
    CMP #$0130          ; $04DB32   |
    BMI CODE_04DB47     ; $04DB35   |
    LDA $10             ; $04DB37   |
    AND #$0006          ; $04DB39   |
    TAY                 ; $04DB3C   |
    LDA $003D           ; $04DB3D   |
    SEC                 ; $04DB40   |
    SBC $DB23,y         ; $04DB41   |
    STA $70E2,x         ; $04DB44   |

CODE_04DB47:
    RTL                 ; $04DB47   |

DATA_04DB48:         dw $003B, $003C, $003D, $003E
DATA_04DB50:         dw $003F

DATA_04DB52:         dw $0000, $000C, $0006, $0006
DATA_04DB5A:         dw $0006, $0006, $0006, $0006
DATA_04DB62:         dw $0006, $0006, $0020

    REP #$30            ; $04DB68   |
    PHB                 ; $04DB6A   |
    PHK                 ; $04DB6B   |
    PLB                 ; $04DB6C   |
    LDA $60AC           ; $04DB6D   |
    ASL A               ; $04DB70   |
    TAY                 ; $04DB71   |
    LDX #$0020          ; $04DB72   |
    LDA $DB52,y         ; $04DB75   |
    STA $60AC           ; $04DB78   |
    STA $61B0           ; $04DB7B   |
    CMP #$000C          ; $04DB7E   |
    BNE CODE_04DBA5     ; $04DB81   |
    LDA #$000E          ; $04DB83   |
    STA $60AE           ; $04DB86   |
    LDA $608C           ; $04DB89   |
    SEC                 ; $04DB8C   |
    SBC #$0010          ; $04DB8D   |
    STA $608C           ; $04DB90   |
    STZ $60B4           ; $04DB93   |
    STZ $60A8           ; $04DB96   |
    STZ $60AA           ; $04DB99   |
    STZ $60D4           ; $04DB9C   |
    JSL $04EF27         ; $04DB9F   |
    BRA CODE_04DBEC     ; $04DBA3   |

CODE_04DBA5:
    CMP #$0006          ; $04DBA5   |
    BNE CODE_04DBEC     ; $04DBA8   |
    PHA                 ; $04DBAA   |
    TYA                 ; $04DBAB   |
    CLC                 ; $04DBAC   |
    ADC #$FFFE          ; $04DBAD   |
    CMP #$000A          ; $04DBB0   |
    BCS CODE_04DBC0     ; $04DBB3   |
    LDX #$0112          ; $04DBB5   |
    STX $60BE           ; $04DBB8   |
    LDX #$0010          ; $04DBBB   |
    BRA CODE_04DBC9     ; $04DBBE   |

CODE_04DBC0:
    SBC #$0008          ; $04DBC0   |
    ORA #$8000          ; $04DBC3   |
    LDX #$0020          ; $04DBC6   |

CODE_04DBC9:
    ORA #$4000          ; $04DBC9   |
    STA $6106           ; $04DBCC   |
    AND #$00FF          ; $04DBCF   |
    CMP #$0006          ; $04DBD2   |
    BCC CODE_04DBE2     ; $04DBD5   |
    TAY                 ; $04DBD7   |
    LDA $608C           ; $04DBD8   |
    ORA #$0008          ; $04DBDB   |
    STA $608C           ; $04DBDE   |
    TYA                 ; $04DBE1   |

CODE_04DBE2:
    AND #$0002          ; $04DBE2   |
    EOR #$0002          ; $04DBE5   |
    STA $60C4           ; $04DBE8   |
    PLA                 ; $04DBEB   |

CODE_04DBEC:
    STX $6126           ; $04DBEC   |
    SEP #$10            ; $04DBEF   |
    CMP #$0020          ; $04DBF1   |
    BNE CODE_04DC0B     ; $04DBF4   |
    LDX #$1C            ; $04DBF6   |

CODE_04DBF8:
    LDA $5FE5AA,x       ; $04DBF8   |
    STA $7021A2,x       ; $04DBFC   |
    STA $702F0E,x       ; $04DC00   |
    DEX                 ; $04DC04   |
    DEX                 ; $04DC05   |
    BPL CODE_04DBF8     ; $04DC06   |
    STZ $617E           ; $04DC08   |

CODE_04DC0B:
    LDA #$0001          ; $04DC0B   |
    STA $60CC           ; $04DC0E   |
    PLB                 ; $04DC11   |
    LDA $608C           ; $04DC12   |
    SEC                 ; $04DC15   |
    SBC #$0078          ; $04DC16   |
    STA $6094           ; $04DC19   |
    LDA $6090           ; $04DC1C   |
    SEC                 ; $04DC1F   |
    SBC #$0064          ; $04DC20   |
    STA $609C           ; $04DC23   |
    BRA CODE_04DC2E     ; $04DC26   |

    LDA #$0020          ; $04DC28   |
    STA $6126           ; $04DC2B   |

CODE_04DC2E:
    LDA #$0061          ; $04DC2E   |
    LDY #$00            ; $04DC31   |
    JSL $03A366         ; $04DC33   |
    LDA #$000A          ; $04DC37   |
    STA $6F00,y         ; $04DC3A   |
    LDA #$000D          ; $04DC3D   |
    STA $7402,y         ; $04DC40   |
    LDA #$0001          ; $04DC43   |
    STA $7902,y         ; $04DC46   |
    LDA #$8000          ; $04DC49   |
    STA $61B2           ; $04DC4C   |
    LDA $608C           ; $04DC4F   |
    STA $70E2,y         ; $04DC52   |
    LDA $6090           ; $04DC55   |
    STA $7182,y         ; $04DC58   |
    LDA $7042,y         ; $04DC5B   |
    AND #$00CF          ; $04DC5E   |
    ORA $6126           ; $04DC61   |
    STA $7042,y         ; $04DC64   |
    JSL $01B2D6         ; $04DC67   |

    REP #$10            ; $04DC6B   |
    LDX #$0126          ; $04DC6D   |

CODE_04DC70:
    LDA $608C           ; $04DC70   |
    STA $05C2,x         ; $04DC73   |
    LDA $6090           ; $04DC76   |
    CLC                 ; $04DC79   |
    ADC #$0010          ; $04DC7A   |
    STA $06EA,x         ; $04DC7D   |
    LDA $6126           ; $04DC80   |
    STA $0812,x         ; $04DC83   |
    DEX                 ; $04DC86   |
    DEX                 ; $04DC87   |
    BPL CODE_04DC70     ; $04DC88   |
    SEP #$10            ; $04DC8A   |
    LDA $608A           ; $04DC8C   |
    STA $7E10           ; $04DC8F   |
    LDA $608C           ; $04DC92   |
    STA $7E12           ; $04DC95   |
    LDA $608E           ; $04DC98   |
    STA $7E14           ; $04DC9B   |
    LDA $6090           ; $04DC9E   |
    STA $7E16           ; $04DCA1   |
    STZ $7E18           ; $04DCA4   |
    LDA #$0F00          ; $04DCA7   |
    STA $7E1A           ; $04DCAA   |
    STZ $7E1C           ; $04DCAD   |
    LDA #$070C          ; $04DCB0   |
    STA $7E1E           ; $04DCB3   |
    LDA #$006C          ; $04DCB6   |
    STA $7E20           ; $04DCB9   |
    LDA #$0058          ; $04DCBC   |
    STA $7E22           ; $04DCBF   |
    SEP #$20            ; $04DCC2   |
    JSL $04FD28         ; $04DCC4   |
    LDY $013E           ; $04DCC8   |
    CPY #$1A            ; $04DCCB   |
    BNE CODE_04DCE5     ; $04DCCD   |
    REP #$20            ; $04DCCF   |
    LDA #$0000          ; $04DCD1   |
    SEC                 ; $04DCD4   |
    SBC $41             ; $04DCD5   |
    STA $0C90           ; $04DCD7   |
    LDA #$0100          ; $04DCDA   |
    SEC                 ; $04DCDD   |
    SBC $43             ; $04DCDE   |
    STA $0C92           ; $04DCE0   |
    SEP #$20            ; $04DCE3   |

CODE_04DCE5:
    PHB                 ; $04DCE5   |
    PHK                 ; $04DCE6   |
    PLB                 ; $04DCE7   |
    LDA $60AC           ; $04DCE8   |
    CMP #$0C            ; $04DCEB   |
    BEQ CODE_04DCF7     ; $04DCED   |
    JSR CODE_04FA33     ; $04DCEF   |
    BNE CODE_04DCF7     ; $04DCF2   |
    INC $0C8E           ; $04DCF4   |

CODE_04DCF7:
    PLB                 ; $04DCF7   |
    RTL                 ; $04DCF8   |

    LDA $608C           ; $04DCF9   |
    SEC                 ; $04DCFC   |
    SBC $0039           ; $04DCFD   |
    SEC                 ; $04DD00   |
    SBC #$000C          ; $04DD01   |
    CMP #$0030          ; $04DD04   |
    BPL CODE_04DD0C     ; $04DD07   |
    LDA #$0030          ; $04DD09   |

CODE_04DD0C:
    CMP #$00A8          ; $04DD0C   |
    BMI CODE_04DD14     ; $04DD0F   |
    LDA #$00A8          ; $04DD11   |

CODE_04DD14:
    STA $7E20           ; $04DD14   |
    LDA $6090           ; $04DD17   |
    SEC                 ; $04DD1A   |
    SBC $003B           ; $04DD1B   |
    CMP #$0040          ; $04DD1E   |
    BPL CODE_04DD26     ; $04DD21   |
    LDA #$0040          ; $04DD23   |

CODE_04DD26:
    CMP #$00A0          ; $04DD26   |
    BMI CODE_04DD2E     ; $04DD29   |
    LDA #$00A0          ; $04DD2B   |

CODE_04DD2E:
    STA $7E22           ; $04DD2E   |
    RTL                 ; $04DD31   |

DATA_04DD32:         dw $0080, $0080

DATA_04DD36:         dw $4000, $4000

DATA_04DD3A:         dw $8000, $8000

DATA_04DD3E:         dw $000C, $000C, $0004, $0004
DATA_04DD46:         dw $0010, $0010, $000C, $000C
DATA_04DD4E:         dw $000D, $000D, $0008, $0008
DATA_04DD56:         dw $0007, $0007, $0007, $0007

DATA_04DD5E:         dw $000C, $FFF4, $0008, $FFF8
DATA_04DD66:         dw $0004, $FFFC, $0004, $FFFC
DATA_04DD6E:         dw $000B, $FFF5, $0008, $FFF8

DATA_04DD76:         dw $0008, $0008, $0008, $0008
DATA_04DD7E:         dw $0006, $000A

DATA_04DD82:         dw $0004, $0004, $0004, $0004
DATA_04DD8A:         dw $0002, $0002, $0004, $FFFC
DATA_04DD92:         dw $0004, $FFFC, $0008, $FFF8
DATA_04DD9A:         dw $0800, $0000

    PHB                 ; $04DD9E   |
    PHK                 ; $04DD9F   |
    PLB                 ; $04DDA0   |
    REP #$30            ; $04DDA1   |
    LDX $6082           ; $04DDA3   |
    LDA $DD36,x         ; $04DDA6   |
    STA $6088           ; $04DDA9   |
    LDA $DD32,x         ; $04DDAC   |
    STA $6086           ; $04DDAF   |
    LDA $DD3A,x         ; $04DDB2   |
    STA $6084           ; $04DDB5   |
    JSR CODE_04F04F     ; $04DDB8   |
    LDA $616E           ; $04DDBB   |
    BEQ CODE_04DDCC     ; $04DDBE   |
    LSR A               ; $04DDC0   |
    BNE CODE_04DDC9     ; $04DDC1   |
    STZ $61AE           ; $04DDC3   |
    STZ $61B0           ; $04DDC6   |

CODE_04DDC9:
    DEC $616E           ; $04DDC9   |

CODE_04DDCC:
    LDA $61AE           ; $04DDCC   |
    BMI CODE_04DDD9     ; $04DDCF   |
    ORA $0B55           ; $04DDD1   |
    ORA $0398           ; $04DDD4   |
    BNE CODE_04DDE8     ; $04DDD7   |

CODE_04DDD9:
    JSR CODE_04DE5F     ; $04DDD9   |
    JSR CODE_04DF4A     ; $04DDDC   |
    JSR CODE_04DE7E     ; $04DDDF   |
    STZ $61B4           ; $04DDE2   |
    STZ $61C2           ; $04DDE5   |

CODE_04DDE8:
    LDA $60AE           ; $04DDE8   |
    BNE CODE_04DE48     ; $04DDEB   |
    LDA $6150           ; $04DDED   |
    INC A               ; $04DDF0   |
    AND #$0006          ; $04DDF1   |
    TAX                 ; $04DDF4   |
    BEQ CODE_04DDFD     ; $04DDF5   |
    LDY $60C6           ; $04DDF7   |
    BEQ CODE_04DDFD     ; $04DDFA   |
    INX                 ; $04DDFC   |

CODE_04DDFD:
    TXA                 ; $04DDFD   |
    ASL A               ; $04DDFE   |
    ASL A               ; $04DDFF   |
    ORA $60C4           ; $04DE00   |
    TAY                 ; $04DE03   |
    TXA                 ; $04DE04   |
    ASL A               ; $04DE05   |
    ORA $60C4           ; $04DE06   |
    TAX                 ; $04DE09   |
    LDA $DD5E,y         ; $04DE0A   |
    CLC                 ; $04DE0D   |
    ADC $6152           ; $04DE0E   |
    STA $0C80           ; $04DE11   |
    CLC                 ; $04DE14   |
    ADC $608C           ; $04DE15   |
    CLC                 ; $04DE18   |
    ADC $DD76,x         ; $04DE19   |
    STA $615A           ; $04DE1C   |
    LDA $60B0           ; $04DE1F   |
    CLC                 ; $04DE22   |
    ADC $0C80           ; $04DE23   |
    STA $6156           ; $04DE26   |
    LDA $DD3E,y         ; $04DE29   |
    CLC                 ; $04DE2C   |
    ADC $6154           ; $04DE2D   |
    STA $0C82           ; $04DE30   |
    CLC                 ; $04DE33   |
    ADC $6090           ; $04DE34   |
    CLC                 ; $04DE37   |
    ADC $DD82,x         ; $04DE38   |
    STA $615C           ; $04DE3B   |
    LDA $60B0           ; $04DE3E   |
    CLC                 ; $04DE41   |
    ADC $0C80           ; $04DE42   |
    STA $6156           ; $04DE45   |

CODE_04DE48:
    LDY $61CE           ; $04DE48   |
    BEQ CODE_04DE5B     ; $04DE4B   |
    LDA $60BE           ; $04DE4D   |
    CMP #$0055          ; $04DE50   |
    BCS CODE_04DE5B     ; $04DE53   |
    ADC #$01AF          ; $04DE55   |
    STA $60BE           ; $04DE58   |

CODE_04DE5B:
    SEP #$30            ; $04DE5B   |
    PLB                 ; $04DE5D   |
    RTL                 ; $04DE5E   |

CODE_04DE5F:
    LDX #$0028          ; $04DE5F   |

CODE_04DE62:
    LDA $0CC6,x         ; $04DE62   |
    BEQ CODE_04DE6A     ; $04DE65   |
    DEC $0CC6,x         ; $04DE67   |

CODE_04DE6A:
    DEX                 ; $04DE6A   |
    DEX                 ; $04DE6B   |
    BPL CODE_04DE62     ; $04DE6C   |
    LDX #$0026          ; $04DE6E   |

CODE_04DE71:
    LDA $61D0,x         ; $04DE71   |
    BEQ CODE_04DE79     ; $04DE74   |
    DEC $61D0,x         ; $04DE76   |

CODE_04DE79:
    DEX                 ; $04DE79   |
    DEX                 ; $04DE7A   |
    BPL CODE_04DE71     ; $04DE7B   |
    RTS                 ; $04DE7D   |

CODE_04DE7E:
    LDA $61B4           ; $04DE7E   |
    LDY $0146           ; $04DE81   |
    CPY #$000D          ; $04DE84   |
    BNE CODE_04DE8C     ; $04DE87   |
    LDA #$0000          ; $04DE89   |

CODE_04DE8C:
    STA $61B8           ; $04DE8C   |
    ORA $60C0           ; $04DE8F   |
    STA $6B             ; $04DE92   |
    STZ $69             ; $04DE94   |
    LDX $7DF6           ; $04DE96   |
    BEQ CODE_04DEE3     ; $04DE99   |

CODE_04DE9B:
    LDY $7DF6,x         ; $04DE9B   |
    LDA $05C0           ; $04DE9E   |
    SEC                 ; $04DEA1   |
    SBC $79D6,y         ; $04DEA2   |
    BPL CODE_04DEAB     ; $04DEA5   |
    CLC                 ; $04DEA7   |
    ADC #$0128          ; $04DEA8   |

CODE_04DEAB:
    TAY                 ; $04DEAB   |
    LDA $0813,y         ; $04DEAC   |
    AND #$00FF          ; $04DEAF   |
    TSB $69             ; $04DEB2   |
    DEX                 ; $04DEB4   |
    DEX                 ; $04DEB5   |
    BNE CODE_04DE9B     ; $04DEB6   |
    LDA $69             ; $04DEB8   |
    ORA $6B             ; $04DEBA   |
    ORA $0C8A           ; $04DEBC   |
    ORA $0B57           ; $04DEBF   |
    BNE CODE_04DEE3     ; $04DEC2   |
    LDA $60B4           ; $04DEC4   |
    CLC                 ; $04DEC7   |
    ADC $7E3A           ; $04DEC8   |
    BPL CODE_04DED1     ; $04DECB   |
    EOR #$FFFF          ; $04DECD   |
    INC A               ; $04DED0   |

CODE_04DED1:
    CLC                 ; $04DED1   |
    ADC $093A           ; $04DED2   |
    STA $093A           ; $04DED5   |
    CMP #$0160          ; $04DED8   |
    BCC CODE_04DF49     ; $04DEDB   |
    SBC #$0160          ; $04DEDD   |
    STA $093A           ; $04DEE0   |

CODE_04DEE3:
    LDY $05C0           ; $04DEE3   |
    LDA $0C8A           ; $04DEE6   |
    BNE CODE_04DEF5     ; $04DEE9   |
    LDA $0B57           ; $04DEEB   |
    BEQ CODE_04DF19     ; $04DEEE   |
    LDA $61B2           ; $04DEF0   |
    BMI CODE_04DF19     ; $04DEF3   |

CODE_04DEF5:
    LDA $70E2           ; $04DEF5   |
    STA $05C2,y         ; $04DEF8   |
    LDA $7182           ; $04DEFB   |
    SEC                 ; $04DEFE   |
    SBC #$FFF3          ; $04DEFF   |
    STA $06EA,y         ; $04DF02   |
    LDA $7222           ; $04DF05   |
    AND #$FF00          ; $04DF08   |
    ORA #$0100          ; $04DF0B   |
    ORA $7042           ; $04DF0E   |
    AND #$FF30          ; $04DF11   |
    LDY $05C0           ; $04DF14   |
    BRA CODE_04DF39     ; $04DF17   |

CODE_04DF19:
    LDA $608C           ; $04DF19   |
    STA $05C2,y         ; $04DF1C   |
    LDA $6090           ; $04DF1F   |
    CLC                 ; $04DF22   |
    ADC #$0010          ; $04DF23   |
    STA $06EA,y         ; $04DF26   |
    LDA $6B             ; $04DF29   |
    BEQ CODE_04DF36     ; $04DF2B   |
    LDA $60AA           ; $04DF2D   |
    AND #$FF00          ; $04DF30   |
    ORA #$0100          ; $04DF33   |

CODE_04DF36:
    ORA $6126           ; $04DF36   |

CODE_04DF39:
    STA $0812,y         ; $04DF39   |
    INY                 ; $04DF3C   |
    INY                 ; $04DF3D   |
    CPY #$0128          ; $04DF3E   |
    BCC CODE_04DF46     ; $04DF41   |
    LDY #$0000          ; $04DF43   |

CODE_04DF46:
    STY $05C0           ; $04DF46   |

CODE_04DF49:
    RTS                 ; $04DF49   |

CODE_04DF4A:
    LDX $60AC           ; $04DF4A   |
    JMP ($DF50,x)       ; $04DF4D   |

DATA_04DF50:         dw $F64C
DATA_04DF52:         dw $E782
DATA_04DF54:         dw $E10B
DATA_04DF56:         dw $E48F
DATA_04DF58:         dw $E696
DATA_04DF5A:         dw $F8F1
DATA_04DF5C:         dw $E413
DATA_04DF5E:         dw $F800
DATA_04DF60:         dw $EDBD
DATA_04DF62:         dw $E905
DATA_04DF64:         dw $F84A
DATA_04DF66:         dw $E8AC
DATA_04DF68:         dw $E79D
DATA_04DF6A:         dw $F849
DATA_04DF6C:         dw $F846
DATA_04DF6E:         dw $E3C6
DATA_04DF70:         dw $E296
DATA_04DF72:         dw $E0BC
DATA_04DF74:         dw $E21F
DATA_04DF76:         dw $E03A
DATA_04DF78:         dw $DF7C
DATA_04DF7A:         dw $E770

    SEP #$10            ; $04DF7C   |
    JSL $04F74A         ; $04DF7E   |
    LDA $61F6           ; $04DF82   |
    BEQ CODE_04DF8E     ; $04DF85   |
    REP #$10            ; $04DF87   |
    DEC $61F6           ; $04DF89   |
    BRA CODE_04DFFE     ; $04DF8C   |

CODE_04DF8E:
    LDA $0030           ; $04DF8E   |
    AND #$0001          ; $04DF91   |
    BNE CODE_04DFC5     ; $04DF94   |
    LDA #$01DF          ; $04DF96   |
    JSL $008B21         ; $04DF99   |
    LDA $608C           ; $04DF9D   |
    STA $70A2,y         ; $04DFA0   |
    LDA $6090           ; $04DFA3   |
    CLC                 ; $04DFA6   |
    ADC #$000C          ; $04DFA7   |
    STA $7142,y         ; $04DFAA   |
    LDA #$0005          ; $04DFAD   |
    STA $7E4C,y         ; $04DFB0   |
    STA $7E4E,y         ; $04DFB3   |
    STA $73C2,y         ; $04DFB6   |
    LDA #$0004          ; $04DFB9   |
    STA $7782,y         ; $04DFBC   |
    LDA #$0006          ; $04DFBF   |
    STA $7462,y         ; $04DFC2   |

CODE_04DFC5:
    LDX #$0B            ; $04DFC5   |
    LDA #$C70A          ; $04DFC7   |
    JSL $7EDE44         ; $04DFCA   | GSU init
    REP #$10            ; $04DFCE   |
    LDA $60B2           ; $04DFD0   |
    CMP #$0120          ; $04DFD3   |
    BMI CODE_04DFE0     ; $04DFD6   |
    JSL $04F6CE         ; $04DFD8   |
    INC $61AE           ; $04DFDC   |
    RTS                 ; $04DFDF   |

CODE_04DFE0:
    LDX #$01AE          ; $04DFE0   |
    LDA $60AA           ; $04DFE3   |
    CLC                 ; $04DFE6   |
    ADC #$0028          ; $04DFE7   |
    CMP #$0400          ; $04DFEA   |
    BMI CODE_04DFF2     ; $04DFED   |
    LDA #$0400          ; $04DFEF   |

CODE_04DFF2:
    STA $60AA           ; $04DFF2   |
    TAY                 ; $04DFF5   |
    BMI CODE_04E001     ; $04DFF6   |
    LDA #$0030          ; $04DFF8   |
    STA $6126           ; $04DFFB   |

CODE_04DFFE:
    LDX #$006B          ; $04DFFE   |

CODE_04E001:
    STX $60BE           ; $04E001   |
    RTS                 ; $04E004   |

DATA_04E005:         db $02, $08, $03, $2C, $02, $16, $03, $12
DATA_04E00D:         db $02, $1C, $03, $1C, $02, $26, $00, $FF
DATA_04E015:         db $02, $10, $00, $40, $01, $06, $00, $14
DATA_04E01D:         db $01, $06, $00, $40, $01, $06, $00, $14
DATA_04E025:         db $01, $06, $00, $40, $01, $06, $00, $14
DATA_04E02D:         db $01, $06, $00, $40, $01, $06, $00, $14
DATA_04E035:         db $01, $06, $00, $7F, $FF

    SEP #$10            ; $04E03A   |
    LDA $61F6           ; $04E03C   |
    BNE CODE_04E07B     ; $04E03F   |

CODE_04E041:
    LDA $617E           ; $04E041   |
    ASL A               ; $04E044   |
    TAX                 ; $04E045   |
    CPX #$08            ; $04E046   |
    BCC CODE_04E04D     ; $04E048   |
    STA $1078           ; $04E04A   |

CODE_04E04D:
    LDY $E005,x         ; $04E04D   |
    BPL CODE_04E05F     ; $04E050   |
    TYA                 ; $04E052   |
    ORA #$FF00          ; $04E053   |
    CLC                 ; $04E056   |
    ADC $617E           ; $04E057   |
    STA $617E           ; $04E05A   |
    BRA CODE_04E041     ; $04E05D   |

CODE_04E05F:
    TYA                 ; $04E05F   |
    LSR A               ; $04E060   |
    XBA                 ; $04E061   |
    BCC CODE_04E067     ; $04E062   |
    ORA $6084           ; $04E064   |

CODE_04E067:
    STA $617A           ; $04E067   |
    STA $617C           ; $04E06A   |
    LDA $E006,x         ; $04E06D   |
    AND #$00FF          ; $04E070   |
    STA $61F6           ; $04E073   |
    INC $617E           ; $04E076   |
    BRA CODE_04E07E     ; $04E079   |

CODE_04E07B:
    STZ $617C           ; $04E07B   |

CODE_04E07E:
    REP #$10            ; $04E07E   |
    LDA $617A           ; $04E080   |
    STA $6070           ; $04E083   |
    LDA $617C           ; $04E086   |
    STA $6072           ; $04E089   |
    JSR CODE_04F6A2     ; $04E08C   |
    LDA $60C0           ; $04E08F   |
    BEQ CODE_04E0BB     ; $04E092   |
    LDX $617E           ; $04E094   |
    CPX #$0008          ; $04E097   |
    BCC CODE_04E0AD     ; $04E09A   |
    CMP #$00DA          ; $04E09C   |
    BCS CODE_04E0AA     ; $04E09F   |
    LDA #$00DA          ; $04E0A1   |
    STA $60C0           ; $04E0A4   |
    STA $6182           ; $04E0A7   |

CODE_04E0AA:
    JSR CODE_04E271     ; $04E0AA   |

CODE_04E0AD:
    LDA #$07A0          ; $04E0AD   |
    CMP $6090           ; $04E0B0   |
    BPL CODE_04E0BB     ; $04E0B3   |
    STA $6090           ; $04E0B5   |
    STZ $60C0           ; $04E0B8   |

CODE_04E0BB:
    RTS                 ; $04E0BB   |

    INC $61B4           ; $04E0BC   |
    SEP #$10            ; $04E0BF   |
    LDX #$0B            ; $04E0C1   |
    LDA #$C703          ; $04E0C3   |
    JSL $7EDE44         ; $04E0C6   | GSU init
    LDA #$0100          ; $04E0CA   |
    STA $6070           ; $04E0CD   |
    LDA $60B0           ; $04E0D0   |
    CMP #$0080          ; $04E0D3   |
    BPL CODE_04E0E6     ; $04E0D6   |
    STZ $6072           ; $04E0D8   |
    LDA $3B             ; $04E0DB   |
    CLC                 ; $04E0DD   |
    ADC #$0080          ; $04E0DE   |
    STA $6090           ; $04E0E1   |
    BRA CODE_04E0FC     ; $04E0E4   |

CODE_04E0E6:
    LDA $60C0           ; $04E0E6   |
    BNE CODE_04E0F1     ; $04E0E9   |
    LDA $6084           ; $04E0EB   |
    STA $6072           ; $04E0EE   |

CODE_04E0F1:
    LDA $60AA           ; $04E0F1   |
    BPL CODE_04E0FC     ; $04E0F4   |
    LDA $6084           ; $04E0F6   |
    TSB $6070           ; $04E0F9   |

CODE_04E0FC:
    INC $60CC           ; $04E0FC   |
    LDX #$0B            ; $04E0FF   |
    LDA #$C6EF          ; $04E101   |
    JSL $7EDECF         ; $04E104   | GSU init
    REP #$10            ; $04E108   |
    RTS                 ; $04E10A   |

    LDA $61B2           ; $04E10B   |
    BMI CODE_04E13F     ; $04E10E   |
    LDA $60C0           ; $04E110   |
    ORA $61D4           ; $04E113   |
    BNE CODE_04E152     ; $04E116   |
    LDA $617E           ; $04E118   |
    CMP #$0002          ; $04E11B   |
    BCS CODE_04E125     ; $04E11E   |
    INC $617E           ; $04E120   |
    BRA CODE_04E19A     ; $04E123   |

CODE_04E125:
    LDA #$0080          ; $04E125   |
    STA $61F6           ; $04E128   |
    LDA $60B4           ; $04E12B   |
    CMP #$FF00          ; $04E12E   |
    BPL CODE_04E139     ; $04E131   |
    LDA #$FF00          ; $04E133   |
    STA $60B4           ; $04E136   |

CODE_04E139:
    LDA #$0200          ; $04E139   |
    JMP CODE_04E216     ; $04E13C   |

CODE_04E13F:
    LDA $0D27           ; $04E13F   |
    CMP #$0008          ; $04E142   |
    BCS CODE_04E158     ; $04E145   |
    LDA $61F6           ; $04E147   |
    BEQ CODE_04E152     ; $04E14A   |
    LSR A               ; $04E14C   |
    BNE CODE_04E152     ; $04E14D   |
    INC $0D27           ; $04E14F   |

CODE_04E152:
    LDA #$0000          ; $04E152   |
    JMP CODE_04E216     ; $04E155   |

CODE_04E158:
    STZ $0C1E           ; $04E158   |
    LDA $60B0           ; $04E15B   |
    CMP #$00A0          ; $04E15E   |
    BPL CODE_04E1A8     ; $04E161   |
    LDA $617E           ; $04E163   |
    ORA $60C0           ; $04E166   |
    ORA $61D4           ; $04E169   |
    BEQ CODE_04E176     ; $04E16C   |
    LDA $608C           ; $04E16E   |
    CMP #$01D0          ; $04E171   |
    BPL CODE_04E179     ; $04E174   |

CODE_04E176:
    JMP CODE_04E205     ; $04E176   |

CODE_04E179:
    LDA $60B4           ; $04E179   |
    BEQ CODE_04E184     ; $04E17C   |
    LDA #$0040          ; $04E17E   |
    STA $61F6           ; $04E181   |

CODE_04E184:
    LDA #$0002          ; $04E184   |
    STA $60C4           ; $04E187   |
    LDA $61F6           ; $04E18A   |
    BNE CODE_04E152     ; $04E18D   |
    LDA $60C0           ; $04E18F   |
    ORA $61D4           ; $04E192   |
    BNE CODE_04E152     ; $04E195   |
    DEC $617E           ; $04E197   |

CODE_04E19A:
    LDA #$FA00          ; $04E19A   |

CODE_04E19D:
    STA $60AA           ; $04E19D   |
    LDA #$0006          ; $04E1A0   |
    STA $60C0           ; $04E1A3   |
    BRA CODE_04E152     ; $04E1A6   |

CODE_04E1A8:
    CMP #$0120          ; $04E1A8   |
    BMI CODE_04E1BA     ; $04E1AB   |
    LDA #$000B          ; $04E1AD   |
    STA $0118           ; $04E1B0   |
    LDA #$000B          ; $04E1B3   |
    STA $021A           ; $04E1B6   |
    RTS                 ; $04E1B9   |

CODE_04E1BA:
    LDA $617E           ; $04E1BA   |
    CMP #$FFFE          ; $04E1BD   |
    BNE CODE_04E179     ; $04E1C0   |
    LDA $60C0           ; $04E1C2   |
    ORA $61D4           ; $04E1C5   |
    BEQ CODE_04E1E3     ; $04E1C8   |
    LDA $60B0           ; $04E1CA   |
    CMP #$00C0          ; $04E1CD   |
    BMI CODE_04E1DA     ; $04E1D0   |
    LDA $6084           ; $04E1D2   |
    ORA #$0100          ; $04E1D5   |
    BRA CODE_04E216     ; $04E1D8   |

CODE_04E1DA:
    LDA #$0040          ; $04E1DA   |

CODE_04E1DD:
    STA $61F6           ; $04E1DD   |

CODE_04E1E0:
    JMP CODE_04E152     ; $04E1E0   |

CODE_04E1E3:
    LDA $60B0           ; $04E1E3   |
    CMP #$00C0          ; $04E1E6   |
    BMI CODE_04E1F0     ; $04E1E9   |
    LDA #$FB00          ; $04E1EB   |
    BRA CODE_04E19D     ; $04E1EE   |

CODE_04E1F0:
    LDA $61F6           ; $04E1F0   |
    BEQ CODE_04E213     ; $04E1F3   |
    LSR A               ; $04E1F5   |
    BNE CODE_04E1E0     ; $04E1F6   |
    LDA $60C4           ; $04E1F8   |
    BEQ CODE_04E1E0     ; $04E1FB   |
    STZ $60C4           ; $04E1FD   |
    LDA #$0060          ; $04E200   |
    BRA CODE_04E1DD     ; $04E203   |

CODE_04E205:
    LDA $60B4           ; $04E205   |
    CMP #$0100          ; $04E208   |
    BMI CODE_04E213     ; $04E20B   |
    LDA #$0100          ; $04E20D   |
    STA $60B4           ; $04E210   |

CODE_04E213:
    LDA #$0100          ; $04E213   |

CODE_04E216:
    STA $6070           ; $04E216   |
    STZ $6072           ; $04E219   |
    JMP CODE_04F6A2     ; $04E21C   |

    LDA $6084           ; $04E21F   |
    STA $6070           ; $04E222   |
    STZ $6072           ; $04E225   |
    STZ $60D2           ; $04E228   |
    LDA #$0001          ; $04E22B   |
    STA $61E6           ; $04E22E   |
    JSR CODE_04F6A2     ; $04E231   |
    LDA $6180           ; $04E234   |
    BEQ CODE_04E248     ; $04E237   |
    DEC $6180           ; $04E239   |
    CMP #$0040          ; $04E23C   |
    BCS CODE_04E247     ; $04E23F   |
    LDA #$004C          ; $04E241   |
    STA $60BE           ; $04E244   |

CODE_04E247:
    RTS                 ; $04E247   |

CODE_04E248:
    LDA $60C0           ; $04E248   |
    BNE CODE_04E271     ; $04E24B   |
    LDA $61D4           ; $04E24D   |
    BNE CODE_04E295     ; $04E250   |
    DEC $617E           ; $04E252   |
    BPL CODE_04E25E     ; $04E255   |
    LDA #$0002          ; $04E257   |
    STA $60AC           ; $04E25A   |
    RTS                 ; $04E25D   |

CODE_04E25E:
    LDA #$FD00          ; $04E25E   |
    STA $60AA           ; $04E261   |
    LDA #$00DA          ; $04E264   |
    STA $60C0           ; $04E267   |
    STA $6182           ; $04E26A   |
    STZ $60D2           ; $04E26D   |
    RTS                 ; $04E270   |

CODE_04E271:
    LDA $60AA           ; $04E271   |
    CMP #$FF00          ; $04E274   |
    BMI CODE_04E28F     ; $04E277   |
    LDA $61D4           ; $04E279   |
    BNE CODE_04E28F     ; $04E27C   |
    LDA #$0004          ; $04E27E   |
    STA $61D4           ; $04E281   |
    LDA $6182           ; $04E284   |
    CMP #$00DD          ; $04E287   |
    BCS CODE_04E28F     ; $04E28A   |
    INC $6182           ; $04E28C   |

CODE_04E28F:
    LDA $6182           ; $04E28F   |
    STA $60BE           ; $04E292   |

CODE_04E295:
    RTS                 ; $04E295   |

    SEP #$10            ; $04E296   |
    LDX #$0B            ; $04E298   |
    LDA #$C70A          ; $04E29A   |
    JSL $7EDE44         ; $04E29D   | GSU init
    LDA $617E           ; $04E2A1   |
    BNE CODE_04E2B9     ; $04E2A4   |
    LDA #$0089          ; $04E2A6   |\ play sound #$0089
    JSL $0085D2         ; $04E2A9   |/
    LDA #$FA00          ; $04E2AD   |
    STA $6180           ; $04E2B0   |
    LDA #$0800          ; $04E2B3   |
    STA $617E           ; $04E2B6   |

CODE_04E2B9:
    SEC                 ; $04E2B9   |
    SBC #$0008          ; $04E2BA   |
    CMP #$0100          ; $04E2BD   |
    BCS CODE_04E2C5     ; $04E2C0   |
    LDA #$0100          ; $04E2C2   |

CODE_04E2C5:
    STA $617E           ; $04E2C5   |
    STA $300C           ; $04E2C8   |
    LDA #$0001          ; $04E2CB   |
    STA $3008           ; $04E2CE   |
    LDX #$0A            ; $04E2D1   |
    LDA #$91C9          ; $04E2D3   |
    JSL $7EDE44         ; $04E2D6   | GSU init
    LDA $300E           ; $04E2DA   |
    STA $00             ; $04E2DD   |
    STA $300C           ; $04E2DF   |
    LDA $6180           ; $04E2E2   |
    STA $3000           ; $04E2E5   |
    LDX #$08            ; $04E2E8   |
    LDA #$B2B2          ; $04E2EA   |
    JSL $7EDE44         ; $04E2ED   | GSU init
    LDA $2FFF           ; $04E2F1   |
    AND #$FF00          ; $04E2F4   |
    STA $02             ; $04E2F7   |
    LDA $3009           ; $04E2F9   |
    AND #$00FF          ; $04E2FC   |
    ORA $02             ; $04E2FF   |
    STA $60A8           ; $04E301   |
    LDA #$FC00          ; $04E304   |
    STA $3000           ; $04E307   |
    LDX #$08            ; $04E30A   |
    LDA #$B2B2          ; $04E30C   |
    JSL $7EDE44         ; $04E30F   | GSU init
    LDA $2FFF           ; $04E313   |
    AND #$FF00          ; $04E316   |
    STA $02             ; $04E319   |
    LDA $3009           ; $04E31B   |
    AND #$00FF          ; $04E31E   |
    ORA $02             ; $04E321   |
    STA $60AA           ; $04E323   |
    LDA $6180           ; $04E326   |
    CLC                 ; $04E329   |
    ADC #$0008          ; $04E32A   |
    STA $6180           ; $04E32D   |
    LDA #$0020          ; $04E330   |
    STA $3004           ; $04E333   |
    STZ $3006           ; $04E336   |
    LDA $7974           ; $04E339   |
    ASL A               ; $04E33C   |
    ASL A               ; $04E33D   |
    ASL A               ; $04E33E   |
    AND #$00FF          ; $04E33F   |
    STA $300A           ; $04E342   |
    LDA #$0040          ; $04E345   |
    STA $3018           ; $04E348   |
    LDA #$0054          ; $04E34B   |
    STA $301A           ; $04E34E   |
    LDX #$08            ; $04E351   |
    LDA #$8205          ; $04E353   |
    JSL $7EDE44         ; $04E356   | GSU init
    LDA #$0164          ; $04E35A   |
    STA $60BE           ; $04E35D   |
    LDA $0383           ; $04E360   |
    ASL A               ; $04E363   |
    TAX                 ; $04E364   |
    LDA $00BA14,x       ; $04E365   |
    CLC                 ; $04E369   |
    ADC #$A000          ; $04E36A   |
    STA $301C           ; $04E36D   |
    LDA #$005F          ; $04E370   |
    STA $3000           ; $04E373   |
    LDA $00             ; $04E376   |
    STA $300C           ; $04E378   |
    LDA #$00D1          ; $04E37B   |
    STA $3010           ; $04E37E   |
    LDA #$000F          ; $04E381   |
    STA $3018           ; $04E384   |
    LDX #$08            ; $04E387   |
    LDA #$E167          ; $04E389   |
    JSL $7EDE44         ; $04E38C   | GSU init
    LDY #$0A            ; $04E390   |
    LDX #$40            ; $04E392   |
    LDA $60B2           ; $04E394   |
    CMP #$FF80          ; $04E397   |
    BPL CODE_04E3BD     ; $04E39A   |
    LDA $0383           ; $04E39C   |
    ASL A               ; $04E39F   |
    STA $6116           ; $04E3A0   |
    JSL $04FB41         ; $04E3A3   |
    LDA #$0002          ; $04E3A7   |
    STA $60AC           ; $04E3AA   |
    LDA #$0140          ; $04E3AD   |
    STA $608C           ; $04E3B0   |
    LDA #$0000          ; $04E3B3   |
    STA $6090           ; $04E3B6   |
    LDY #$2A            ; $04E3B9   |
    LDX #$00            ; $04E3BB   |

CODE_04E3BD:
    STY $7042           ; $04E3BD   |
    STX $70E0           ; $04E3C0   |
    REP #$10            ; $04E3C3   |
    RTS                 ; $04E3C5   |

    SEP #$10            ; $04E3C6   |
    LDX #$0B            ; $04E3C8   |
    LDA #$C70A          ; $04E3CA   |
    JSL $7EDE44         ; $04E3CD   | GSU init
    LDX #$0B            ; $04E3D1   |
    LDA #$C6F7          ; $04E3D3   |
    JSL $7EDE44         ; $04E3D6   | GSU init
    REP #$10            ; $04E3DA   |
    LDA $60FC           ; $04E3DC   |
    AND #$0180          ; $04E3DF   |
    BEQ CODE_04E3EC     ; $04E3E2   |
    LDA #$0800          ; $04E3E4   |
    LDY #$FC00          ; $04E3E7   |
    BRA CODE_04E3FA     ; $04E3EA   |

CODE_04E3EC:
    LDA $60FC           ; $04E3EC   |
    AND #$0060          ; $04E3EF   |
    BEQ CODE_04E400     ; $04E3F2   |
    LDA #$FC00          ; $04E3F4   |
    LDY #$F800          ; $04E3F7   |

CODE_04E3FA:
    STA $60A8           ; $04E3FA   |
    STY $60AA           ; $04E3FD   |

CODE_04E400:
    LDA $60B2           ; $04E400   |
    CMP #$FFC0          ; $04E403   |
    BPL CODE_04E40C     ; $04E406   |
    JSL $02A4B5         ; $04E408   |

CODE_04E40C:
    LDA #$006B          ; $04E40C   |
    STA $60BE           ; $04E40F   |
    RTS                 ; $04E412   |
    LDA $60B0           ; $04E413   |
    CMP #$0020          ; $04E416   |
    BMI CODE_04E41E     ; $04E419   |
    STZ $60AC           ; $04E41B   |

CODE_04E41E:
    LDA #$0300          ; $04E41E   |
    STA $60B4           ; $04E421   |
    LDA #$0100          ; $04E424   |
    STA $6070           ; $04E427   |
    STZ $6072           ; $04E42A   |
    JSR CODE_04F6A2     ; $04E42D   |
    LDA #$000F          ; $04E430   |
    TRB $6090           ; $04E433   |
    RTS                 ; $04E436   |

DATA_04E437:         dw $0080, $FF80

DATA_04E43B:         dw $0008, $0006

DATA_04E43F:         dw $0100, $F400

DATA_04E443:         dw $0100, $FF00

DATA_04E447:         dw $0011, $0012

DATA_04E44B:         dw $0011, $010C

DATA_04E44F:         dw $010D, $010E

DATA_04E453:         dw $010F, $0101

DATA_04E457:         dw $0102, $0103

DATA_04E45B:         dw $0104, $0105

DATA_04E45F:         dw $0106, $0107

DATA_04E463:         dw $0108, $0109

DATA_04E467:         dw $010A, $010B

DATA_04E46B:         dw $0000, $000E

DATA_04E46F:         dw $0007, $000B

DATA_04E473:         dw $0006, $0004

DATA_04E477:         dw $0001, $FFFF

DATA_04E47B:         dw $FFFE, $0002

DATA_04E47F:         dw $FFE1, $001F

DATA_04E483:         dw $0000, $0000

DATA_04E487:         dw $0000, $0000

DATA_04E48B:         dw $FFE1, $001F

    LDA $60A8           ; $04E48F   |
    ORA $60AA           ; $04E492   |
    ORA $60C0           ; $04E495   |
    BNE CODE_04E4B1     ; $04E498   |
    LDA #$0031          ; $04E49A   |
    LDY $0146           ; $04E49D   |
    CPY #$000D          ; $04E4A0   |
    BNE CODE_04E4AD     ; $04E4A3   |
    LDY $6106           ; $04E4A5   |
    BMI CODE_04E4B1     ; $04E4A8   |
    LDA #$0014          ; $04E4AA   |\ play sound #$0014

CODE_04E4AD:
    JSL $0085D2         ; $04E4AD   |/

CODE_04E4B1:
    INC $61B4           ; $04E4B1   |
    SEP #$10            ; $04E4B4   |
    LDY $6106           ; $04E4B6   |
    CPY #$06            ; $04E4B9   |
    BCS CODE_04E4C0     ; $04E4BB   |
    JMP CODE_04E589     ; $04E4BD   |

CODE_04E4C0:
    STZ $60B4           ; $04E4C0   |
    STZ $60A8           ; $04E4C3   |
    BIT $6106           ; $04E4C6   |
    BVC CODE_04E511     ; $04E4C9   |
    LDA $608C           ; $04E4CB   |
    AND #$000F          ; $04E4CE   |
    CMP #$0008          ; $04E4D1   |
    BEQ CODE_04E4E6     ; $04E4D4   |
    LDX #$00            ; $04E4D6   |
    BCC CODE_04E4DC     ; $04E4D8   |
    LDX #$02            ; $04E4DA   |

CODE_04E4DC:
    LDA $608C           ; $04E4DC   |
    CLC                 ; $04E4DF   |
    ADC $E477,x         ; $04E4E0   |
    STA $608C           ; $04E4E3   |

CODE_04E4E6:
    LDA $6106           ; $04E4E6   |
    AND #$A000          ; $04E4E9   |
    CMP #$8000          ; $04E4EC   |
    BNE CODE_04E4FC     ; $04E4EF   |
    LDA $E435,y         ; $04E4F1   |
    STA $60C0           ; $04E4F4   |
    LDA $E439,y         ; $04E4F7   |
    BRA CODE_04E505     ; $04E4FA   |

CODE_04E4FC:
    LDA #$0112          ; $04E4FC   |
    STA $60C0           ; $04E4FF   |
    LDA $E43D,y         ; $04E502   |

CODE_04E505:
    STA $60AA           ; $04E505   |
    BPL CODE_04E50E     ; $04E508   |
    EOR #$FFFF          ; $04E50A   |
    INC A               ; $04E50D   |

CODE_04E50E:
    JMP CODE_04E5A2     ; $04E50E   |

CODE_04E511:
    LDX $60C4           ; $04E511   |
    LDA $610E           ; $04E514   |
    CLC                 ; $04E517   |
    ADC $E47B,x         ; $04E518   |
    LDX #$00            ; $04E51B   |
    CMP $608C           ; $04E51D   |
    BEQ CODE_04E530     ; $04E520   |
    BPL CODE_04E526     ; $04E522   |
    LDX #$02            ; $04E524   |

CODE_04E526:
    LDA $608C           ; $04E526   |
    CLC                 ; $04E529   |
    ADC $E477,x         ; $04E52A   |
    STA $608C           ; $04E52D   |

CODE_04E530:
    LDA $61F6           ; $04E530   |
    BNE CODE_04E546     ; $04E533   |
    LDA $610A           ; $04E535   |
    CMP $E469,y         ; $04E538   |
    BEQ CODE_04E546     ; $04E53B   |
    INC $610A           ; $04E53D   |
    LDA $E46D,y         ; $04E540   |
    STA $61F6           ; $04E543   |

CODE_04E546:
    LDA $610A           ; $04E546   |
    ASL A               ; $04E549   |
    ADC $E465,y         ; $04E54A   |
    TAX                 ; $04E54D   |
    LDA $E445,x         ; $04E54E   |
    STA $60C0           ; $04E551   |
    STZ $60C2           ; $04E554   |
    LDA $0030           ; $04E557   |
    AND #$0001          ; $04E55A   |
    BNE CODE_04E56B     ; $04E55D   |
    LDA $610C           ; $04E55F   |
    ASL A               ; $04E562   |
    BCC CODE_04E568     ; $04E563   |
    LDA #$FFFF          ; $04E565   |

CODE_04E568:
    STA $610C           ; $04E568   |

CODE_04E56B:
    LDA $610C           ; $04E56B   |
    XBA                 ; $04E56E   |
    AND #$00FF          ; $04E56F   |
    CPY #$06            ; $04E572   |
    BEQ CODE_04E57A     ; $04E574   |
    EOR #$FFFF          ; $04E576   |
    INC A               ; $04E579   |

CODE_04E57A:
    CLC                 ; $04E57A   |
    ADC $60AA           ; $04E57B   |
    STA $60AA           ; $04E57E   |
    BPL CODE_04E5A2     ; $04E581   |
    EOR #$FFFF          ; $04E583   |
    INC A               ; $04E586   |
    BRA CODE_04E5A2     ; $04E587   |

CODE_04E589:
    STZ $60AA           ; $04E589   |
    LDX #$00            ; $04E58C   |
    LDA $E435,y         ; $04E58E   |
    STA $60B4           ; $04E591   |
    STA $60A8           ; $04E594   |
    BPL CODE_04E59F     ; $04E597   |
    LDX #$02            ; $04E599   |
    EOR #$FFFF          ; $04E59B   |
    INC A               ; $04E59E   |

CODE_04E59F:
    STX $60C4           ; $04E59F   |

CODE_04E5A2:
    CLC                 ; $04E5A2   |
    ADC $6108           ; $04E5A3   |
    STA $6108           ; $04E5A6   |
    CMP #$1F00          ; $04E5A9   |
    BCS CODE_04E5B1     ; $04E5AC   |
    JMP CODE_04E644     ; $04E5AE   |

CODE_04E5B1:
    BIT $6106           ; $04E5B1   |
    BVC CODE_04E5D9     ; $04E5B4   |
    LDA $60AA           ; $04E5B6   |
    CMP #$FF00          ; $04E5B9   |
    BPL CODE_04E5C6     ; $04E5BC   |
    LDA #$002A          ; $04E5BE   |
    STA $60AC           ; $04E5C1   |
    BRA CODE_04E5D7     ; $04E5C4   |

CODE_04E5C6:
    STZ $60AC           ; $04E5C6   |
    STZ $61B0           ; $04E5C9   |
    LDA $60C0           ; $04E5CC   |
    BEQ CODE_04E5D7     ; $04E5CF   |
    LDA #$0008          ; $04E5D1   |
    STA $60C0           ; $04E5D4   |

CODE_04E5D7:
    BRA CODE_04E64C     ; $04E5D7   |

CODE_04E5D9:
    LDA $6106           ; $04E5D9   |
    AND #$2000          ; $04E5DC   |
    BEQ CODE_04E620     ; $04E5DF   |
    LDA #$0008          ; $04E5E1   |
    STA $60AC           ; $04E5E4   |
    LDA $608C           ; $04E5E7   |
    STA $3010           ; $04E5EA   |
    LDA $6090           ; $04E5ED   |
    CLC                 ; $04E5F0   |
    ADC #$0038          ; $04E5F1   |
    STA $3000           ; $04E5F4   |
    LDX #$0A            ; $04E5F7   |
    LDA #$CE2F          ; $04E5F9   |
    JSL $7EDE91         ; $04E5FC   | GSU init
    LDA #$0000          ; $04E600   |
    LDY $300D           ; $04E603   |
    CPY #$3D            ; $04E606   |
    BEQ CODE_04E60D     ; $04E608   |
    LDA #$0002          ; $04E60A   |

CODE_04E60D:
    STA $6106           ; $04E60D   |
    LDA $6090           ; $04E610   |
    CLC                 ; $04E613   |
    ADC #$0008          ; $04E614   |
    AND #$FFF0          ; $04E617   |
    DEC A               ; $04E61A   |
    STA $6090           ; $04E61B   |
    BRA CODE_04E65E     ; $04E61E   |

CODE_04E620:
    LDY $6106           ; $04E620   |
    LDA $608C           ; $04E623   |
    CLC                 ; $04E626   |
    ADC $E47D,y         ; $04E627   |
    XBA                 ; $04E62A   |
    AND #$000F          ; $04E62B   |
    ASL A               ; $04E62E   |
    ASL A               ; $04E62F   |
    STA $00             ; $04E630   |
    LDA $6090           ; $04E632   |
    CLC                 ; $04E635   |
    ADC $E485,y         ; $04E636   |
    AND #$0F00          ; $04E639   |
    LSR A               ; $04E63C   |
    LSR A               ; $04E63D   |
    ORA $00             ; $04E63E   |
    JSL $02A4CB         ; $04E640   |

CODE_04E644:
    LDA #$0010          ; $04E644   |
    BIT $6106           ; $04E647   |
    BPL CODE_04E64F     ; $04E64A   |

CODE_04E64C:
    LDA #$0020          ; $04E64C   |

CODE_04E64F:
    STA $6126           ; $04E64F   |
    JSR CODE_04E661     ; $04E652   |
    LDX #$0B            ; $04E655   |
    LDA #$C6DA          ; $04E657   |
    JSL $7EDECF         ; $04E65A   | GSU init

CODE_04E65E:
    REP #$10            ; $04E65E   |
    RTS                 ; $04E660   |

CODE_04E661:
    LDA $7042           ; $04E661   |
    AND #$00CF          ; $04E664   |
    ORA $6126           ; $04E667   |
    STA $7042           ; $04E66A   |
    LDX $7DF6           ; $04E66D   |
    BEQ CODE_04E685     ; $04E670   |

CODE_04E672:
    LDY $7DF6,x         ; $04E672   |
    LDA $7042,y         ; $04E675   |
    AND #$00CF          ; $04E678   |
    ORA $6126           ; $04E67B   |
    STA $7042,y         ; $04E67E   |
    DEX                 ; $04E681   |
    DEX                 ; $04E682   |
    BNE CODE_04E672     ; $04E683   |

CODE_04E685:
    RTS                 ; $04E685   |

DATA_04E686:         dw $007C, $008C

DATA_04E68A:         dw $0004, $FFFC

DATA_04E68E:         dw $FFF1, $0000

DATA_04E692:         dw $3D35, $3D2F

    STZ $60C0           ; $04E696   |
    INC $61B4           ; $04E699   |
    SEP #$10            ; $04E69C   |
    LDY $6106           ; $04E69E   |
    LDA $6090           ; $04E6A1   |
    CLC                 ; $04E6A4   |
    ADC $E68A,y         ; $04E6A5   |
    STA $6090           ; $04E6A8   |
    CLC                 ; $04E6AB   |
    ADC $E68E,y         ; $04E6AC   |
    STA $3000           ; $04E6AF   |
    LDA $608C           ; $04E6B2   |
    STA $3010           ; $04E6B5   |
    LDX #$0A            ; $04E6B8   |
    LDA #$CE2F          ; $04E6BA   |
    JSL $7EDE91         ; $04E6BD   | GSU init
    LDY $6106           ; $04E6C1   |
    LDA $300C           ; $04E6C4   |
    CMP $E692,y         ; $04E6C7   |
    BNE CODE_04E748     ; $04E6CA   |
    LDA $608C           ; $04E6CC   |
    STA $3010           ; $04E6CF   |
    LDA $6090           ; $04E6D2   |
    CLC                 ; $04E6D5   |
    ADC #$0008          ; $04E6D6   |
    STA $3000           ; $04E6D9   |
    LDX #$0A            ; $04E6DC   |
    LDA #$CE2F          ; $04E6DE   |
    JSL $7EDE91         ; $04E6E1   | GSU init
    LDA $300C           ; $04E6E5   |
    CMP #$7D24          ; $04E6E8   |
    BNE CODE_04E729     ; $04E6EB   |
    LDX $7DF6           ; $04E6ED   |
    BEQ CODE_04E6FD     ; $04E6F0   |
    LDY $7DF6,x         ; $04E6F2   |
    LDA $7360,y         ; $04E6F5   |
    CMP #$0027          ; $04E6F8   |
    BEQ CODE_04E708     ; $04E6FB   |

CODE_04E6FD:
    LDA $6106           ; $04E6FD   |
    EOR #$0002          ; $04E700   |
    STA $6106           ; $04E703   |
    BRA CODE_04E748     ; $04E706   |

CODE_04E708:
    LDA $608C           ; $04E708   |
    STA $91             ; $04E70B   |
    LDA $6090           ; $04E70D   |
    CLC                 ; $04E710   |
    ADC #$0008          ; $04E711   |
    STA $93             ; $04E714   |
    LDA #$0001          ; $04E716   |
    STA $008F           ; $04E719   |
    LDA #$7D22          ; $04E71C   |
    STA $0095           ; $04E71F   |
    JSL $109295         ; $04E722   |
    INC $61AE           ; $04E726   |

CODE_04E729:
    LDA #$0006          ; $04E729   |
    STA $60AC           ; $04E72C   |
    LDA #$E008          ; $04E72F   |
    STA $6106           ; $04E732   |
    STZ $6108           ; $04E735   |
    LDA $6090           ; $04E738   |
    CLC                 ; $04E73B   |
    ADC #$0008          ; $04E73C   |
    AND #$FFF0          ; $04E73F   |
    DEC A               ; $04E742   |
    STA $6090           ; $04E743   |
    BRA CODE_04E74B     ; $04E746   |

CODE_04E748:
    STZ $611A           ; $04E748   |

CODE_04E74B:
    JSR CODE_04E751     ; $04E74B   |
    REP #$10            ; $04E74E   |
    RTS                 ; $04E750   |

CODE_04E751:
    LDX $611A           ; $04E751   |
    DEX                 ; $04E754   |
    TXY                 ; $04E755   |
    BMI CODE_04E75C     ; $04E756   |
    LDX #$A004          ; $04E758   |
    ORA $8E             ; $04E75B   |
    LDX #$9874          ; $04E75D   |
    LDX $7DF6           ; $04E760   |
    BEQ CODE_04E76F     ; $04E763   |

CODE_04E765:
    LDY $7DF6,x         ; $04E765   |
    STA $74A2,y         ; $04E768   |
    DEX                 ; $04E76B   |
    DEX                 ; $04E76C   |
    BNE CODE_04E765     ; $04E76D   |

CODE_04E76F:
    RTS                 ; $04E76F   |

    STZ $617A           ; $04E770   |
    STZ $617C           ; $04E773   |
    LDA $60C0           ; $04E776   |
    BNE CODE_04E782     ; $04E779   |
    STZ $60AC           ; $04E77B   |
    STZ $61B0           ; $04E77E   |
    RTS                 ; $04E781   |

CODE_04E782:
    LDA $617A           ; $04E782   |
    STA $6070           ; $04E785   |
    LDA $617C           ; $04E788   |
    STA $6072           ; $04E78B   |
    JMP CODE_04F6A2     ; $04E78E   |

DATA_04E791:         dw $60A0, $2060, $00A0, $2000
DATA_04E799:         dw $00C0, $0000

    STZ $61B6           ; $04E79D   |
    LDA #$0001          ; $04E7A0   |
    STA $61B0           ; $04E7A3   |
    LDA $61F4           ; $04E7A6   |
    BEQ CODE_04E7BD     ; $04E7A9   |
    LSR A               ; $04E7AB   |
    BNE CODE_04E7BA     ; $04E7AC   |
    LDA $0C88           ; $04E7AE   |
    BEQ CODE_04E7BA     ; $04E7B1   |
    LDA #$007D          ; $04E7B3   |\ play sound #$007D
    JSL $0085D2         ; $04E7B6   |/

CODE_04E7BA:
    JMP CODE_04E8AB     ; $04E7BA   |

CODE_04E7BD:
    STZ $60AE           ; $04E7BD   |
    SEP #$10            ; $04E7C0   |
    LDA #$0186          ; $04E7C2   |
    STA $60BE           ; $04E7C5   |
    LDA #$0020          ; $04E7C8   |
    STA $3004           ; $04E7CB   |
    STZ $3006           ; $04E7CE   |
    LDA $0C84           ; $04E7D1   |
    CLC                 ; $04E7D4   |
    ADC #$0010          ; $04E7D5   |
    AND #$00FF          ; $04E7D8   |
    STA $0C84           ; $04E7DB   |
    STA $300A           ; $04E7DE   |
    LDA #$0100          ; $04E7E1   |
    STA $300C           ; $04E7E4   |
    LDY $0C8A           ; $04E7E7   |
    LDA $E78F,y         ; $04E7EA   |
    STA $3018           ; $04E7ED   |
    LDA #$0054          ; $04E7F0   |
    STA $301A           ; $04E7F3   |
    LDX #$08            ; $04E7F6   |
    LDA #$8205          ; $04E7F8   |
    JSL $7EDE44         ; $04E7FB   | GSU init
    LDA $70E2           ; $04E7FF   |
    STA $3002           ; $04E802   |
    LDA $7182           ; $04E805   |
    SEC                 ; $04E808   |
    SBC #$0010          ; $04E809   |
    STA $3004           ; $04E80C   |
    LDA $608C           ; $04E80F   |
    STA $3006           ; $04E812   |
    LDA $6090           ; $04E815   |
    STA $3008           ; $04E818   |
    LDA #$0800          ; $04E81B   |
    STA $300C           ; $04E81E   |
    LDX #$09            ; $04E821   |
    LDA #$907C          ; $04E823   |
    JSL $7EDE44         ; $04E826   | GSU init
    LDA $3002           ; $04E82A   |
    STA $60A8           ; $04E82D   |
    LDA $3004           ; $04E830   |
    STA $60AA           ; $04E833   |
    LDX #$0B            ; $04E836   |
    LDA #$C70A          ; $04E838   |
    JSL $7EDE44         ; $04E83B   | GSU init
    REP #$10            ; $04E83F   |
    LDA $70E2           ; $04E841   |
    SEC                 ; $04E844   |
    SBC $608C           ; $04E845   |
    BEQ CODE_04E855     ; $04E848   |
    EOR $60A8           ; $04E84A   |
    BPL CODE_04E8AB     ; $04E84D   |
    LDA $70E2           ; $04E84F   |
    STA $608C           ; $04E852   |

CODE_04E855:
    LDA $7182           ; $04E855   |
    SEC                 ; $04E858   |
    SBC #$0010          ; $04E859   |
    STA $00             ; $04E85C   |
    SEC                 ; $04E85E   |
    SBC $6090           ; $04E85F   |
    BEQ CODE_04E86E     ; $04E862   |
    EOR $60AA           ; $04E864   |
    BPL CODE_04E8AB     ; $04E867   |
    LDA $00             ; $04E869   |
    STA $6090           ; $04E86B   |

CODE_04E86E:
    STZ $60AC           ; $04E86E   |
    JSL $04EF27         ; $04E871   |
    STZ $0C8A           ; $04E875   |
    STZ $6150           ; $04E878   |
    STZ $60C6           ; $04E87B   |
    LDA #$0003          ; $04E87E   |
    STA $60C2           ; $04E881   |
    STZ $60B4           ; $04E884   |
    STZ $60A8           ; $04E887   |
    STZ $60AA           ; $04E88A   |
    STZ $61B0           ; $04E88D   |
    STZ $6112           ; $04E890   |
    LDA #$BC00          ; $04E893   |
    STA $6114           ; $04E896   |
    SEP #$30            ; $04E899   |
    LDX $0BF1           ; $04E89B   |
    BEQ CODE_04E8A9     ; $04E89E   |

CODE_04E8A0:
    STZ $0BF1,x         ; $04E8A0   |
    DEX                 ; $04E8A3   |
    BNE CODE_04E8A0     ; $04E8A4   |
    STZ $0BF1           ; $04E8A6   |

CODE_04E8A9:
    REP #$30            ; $04E8A9   |

CODE_04E8AB:
    RTS                 ; $04E8AB   |

    LDA $6084           ; $04E8AC   |
    STA $6070           ; $04E8AF   |
    STZ $6072           ; $04E8B2   |
    STZ $60D2           ; $04E8B5   |
    LDA #$0001          ; $04E8B8   |
    STA $61E6           ; $04E8BB   |
    SEP #$10            ; $04E8BE   |
    LDX #$0B            ; $04E8C0   |
    LDA #$C703          ; $04E8C2   |
    JSL $7EDE44         ; $04E8C5   | GSU init
    LDA $60AA           ; $04E8C9   |
    BMI CODE_04E8EA     ; $04E8CC   |
    LDA $3B             ; $04E8CE   |
    CLC                 ; $04E8D0   |
    ADC #$0094          ; $04E8D1   |
    CMP $6090           ; $04E8D4   |
    BCS CODE_04E8EA     ; $04E8D7   |
    STA $6090           ; $04E8D9   |
    LDA $60C0           ; $04E8DC   |
    BEQ CODE_04E8EA     ; $04E8DF   |
    STZ $60C0           ; $04E8E1   |
    LDA #$0005          ; $04E8E4   |
    STA $61D4           ; $04E8E7   |

CODE_04E8EA:
    INC $60CC           ; $04E8EA   |
    LDX #$0B            ; $04E8ED   |
    LDA #$C6EF          ; $04E8EF   |
    JSL $7EDECF         ; $04E8F2   | GSU init
    REP #$10            ; $04E8F6   |
    RTS                 ; $04E8F8   |

DATA_04E8F9:         dw $0003, $FFFD, $0010, $FFF0
DATA_04E901:         dw $0100, $FF00

    LDY $7E40           ; $04E905   |
    BEQ CODE_04E90D     ; $04E908   |
    JMP CODE_04E9D0     ; $04E90A   |

CODE_04E90D:
    SEP #$10            ; $04E90D   |
    LDY $0CBC           ; $04E90F   |
    BNE CODE_04E944     ; $04E912   |
    LDA #$007D          ; $04E914   |\ play sound #$007D
    JSL $0085D2         ; $04E917   |/
    LDY $60C4           ; $04E91B   |
    LDA $608C           ; $04E91E   |
    CLC                 ; $04E921   |
    ADC $E8F9,y         ; $04E922   |
    STA $608C           ; $04E925   |
    LDA $6090           ; $04E928   |
    SEC                 ; $04E92B   |
    SBC #$0008          ; $04E92C   |
    STA $6090           ; $04E92F   |
    STZ $0CBB           ; $04E932   |
    INC $0CBC           ; $04E935   |
    STZ $0CBE           ; $04E938   |
    LDA #$007F          ; $04E93B   |
    STA $0CC0           ; $04E93E   |
    JMP CODE_04E9C0     ; $04E941   |

CODE_04E944:
    CPY #$38            ; $04E944   |
    BCC CODE_04E96C     ; $04E946   |
    LDA $60AA           ; $04E948   |
    CLC                 ; $04E94B   |
    ADC #$0008          ; $04E94C   |
    CMP #$0080          ; $04E94F   |
    BMI CODE_04E957     ; $04E952   |
    LDA #$0080          ; $04E954   |

CODE_04E957:
    STA $60AA           ; $04E957   |
    LDX #$0B            ; $04E95A   |
    LDA #$C711          ; $04E95C   |
    JSL $7EDE44         ; $04E95F   | GSU init
    LDX #$0B            ; $04E963   |
    LDA #$C6F7          ; $04E965   |
    JSL $7EDECF         ; $04E968   | GSU init

CODE_04E96C:
    LDA $0CBC           ; $04E96C   |
    CMP #$0079          ; $04E96F   |
    BNE CODE_04E982     ; $04E972   |
    LDA #$0000          ; $04E974   |
    STA $60AC           ; $04E977   |
    STZ $61B6           ; $04E97A   |
    STA $0D94           ; $04E97D   |
    BRA CODE_04E998     ; $04E980   |

CODE_04E982:
    LDA $0CBE           ; $04E982   |
    CMP #$0180          ; $04E985   |
    BEQ CODE_04E991     ; $04E988   |
    CLC                 ; $04E98A   |
    ADC #$0010          ; $04E98B   |
    STA $0CBE           ; $04E98E   |

CODE_04E991:
    CLC                 ; $04E991   |
    ADC $0CBB           ; $04E992   |
    STA $0CBB           ; $04E995   |

CODE_04E998:
    LDA $0CBC           ; $04E998   |
    STA $3012           ; $04E99B   |
    LDA #$0054          ; $04E99E   |
    STA $3014           ; $04E9A1   |
    LDA #$40E0          ; $04E9A4   |
    STA $3016           ; $04E9A7   |
    LDA #$6060          ; $04E9AA   |
    STA $3018           ; $04E9AD   |
    LDA $0CC0           ; $04E9B0   |
    XBA                 ; $04E9B3   |
    STA $3010           ; $04E9B4   |
    LDX #$08            ; $04E9B7   |
    LDA #$C136          ; $04E9B9   |
    JSL $7EDE44         ; $04E9BC   | GSU init

CODE_04E9C0:
    LDA #$0196          ; $04E9C0   |
    LDY $0CBC           ; $04E9C3   |
    CPY #$68            ; $04E9C6   |
    BCS CODE_04E9CD     ; $04E9C8   |
    LDA #$0197          ; $04E9CA   |

CODE_04E9CD:
    JMP CODE_04EA92     ; $04E9CD   |

CODE_04E9D0:
    STZ $0CBC           ; $04E9D0   |
    LDA $0CBA           ; $04E9D3   |
    BPL CODE_04E9DD     ; $04E9D6   |
    LDA #$0080          ; $04E9D8   |
    BRA CODE_04EA3A     ; $04E9DB   |

CODE_04E9DD:
    LDY $0CB4           ; $04E9DD   |
    DEY                 ; $04E9E0   |
    BNE CODE_04EA37     ; $04E9E1   |
    CLC                 ; $04E9E3   |
    ADC #$0004          ; $04E9E4   |
    XBA                 ; $04E9E7   |
    STA $4204           ; $04E9E8   |
    LDA #$001C          ; $04E9EB   |
    STA $4206           ; $04E9EE   |
    NOP                 ; $04E9F1   |
    NOP                 ; $04E9F2   |
    NOP                 ; $04E9F3   |
    NOP                 ; $04E9F4   |
    NOP                 ; $04E9F5   |
    NOP                 ; $04E9F6   |
    NOP                 ; $04E9F7   |
    REP #$20            ; $04E9F8   |
    LDA $4214           ; $04E9FA   |
    STA $3016           ; $04E9FD   |
    LDA #$0100          ; $04EA00   |
    STA $300C           ; $04EA03   |
    STZ $3006           ; $04EA06   |
    LDA #$0020          ; $04EA09   |
    STA $3004           ; $04EA0C   |
    LDA #$0010          ; $04EA0F   |
    STA $3010           ; $04EA12   |
    LDA #$001F          ; $04EA15   |
    STA $3012           ; $04EA18   |
    LDA #$40E0          ; $04EA1B   |
    STA $3018           ; $04EA1E   |
    LDA #$0054          ; $04EA21   |
    STA $301A           ; $04EA24   |
    SEP #$10            ; $04EA27   |
    LDX #$08            ; $04EA29   |
    LDA #$8295          ; $04EA2B   |
    JSL $7EDE44         ; $04EA2E   | GSU init
    LDA #$0164          ; $04EA32   |
    BRA CODE_04EA92     ; $04EA35   |

CODE_04EA37:
    LDA #$40E0          ; $04EA37   |

CODE_04EA3A:
    STA $3016           ; $04EA3A   |
    LDA #$0054          ; $04EA3D   |
    STA $3014           ; $04EA40   |
    LDA $7E46           ; $04EA43   |
    LDY $60C4           ; $04EA46   |
    BNE CODE_04EA4F     ; $04EA49   |
    EOR #$FFFF          ; $04EA4B   |
    INC A               ; $04EA4E   |

CODE_04EA4F:
    STA $3002           ; $04EA4F   |
    LDA #$FFA0          ; $04EA52   |
    STA $3004           ; $04EA55   |
    LDA $0CB8           ; $04EA58   |
    STA $3006           ; $04EA5B   |
    LDA $7E40           ; $04EA5E   |
    AND #$00FF          ; $04EA61   |
    STA $3008           ; $04EA64   |
    SEP #$10            ; $04EA67   |
    LDX #$08            ; $04EA69   |
    LDA #$C045          ; $04EA6B   |
    JSL $7EDE44         ; $04EA6E   | GSU init
    LDA $6000           ; $04EA72   |
    LDY $60C4           ; $04EA75   |
    BNE CODE_04EA7E     ; $04EA78   |
    EOR #$FFFF          ; $04EA7A   |
    INC A               ; $04EA7D   |

CODE_04EA7E:
    CLC                 ; $04EA7E   |
    ADC $7E42           ; $04EA7F   |
    STA $608C           ; $04EA82   |
    LDA $0CB6           ; $04EA85   |
    CLC                 ; $04EA88   |
    ADC $6002           ; $04EA89   |
    STA $6090           ; $04EA8C   |
    LDA #$0195          ; $04EA8F   |

CODE_04EA92:
    STA $60BE           ; $04EA92   |
    REP #$10            ; $04EA95   |
    RTS                 ; $04EA97   |

DATA_04EA98:         db $E0, $5F, $20, $0B, $0F, $0F, $13, $0B
DATA_04EAA0:         db $0F, $0F, $14, $0B, $0F, $0F, $14, $0B
DATA_04EAA8:         db $0F, $0F, $13, $0A, $0F, $0F, $12, $09
DATA_04EAB0:         db $12, $16, $18, $08, $13, $15, $19, $02
DATA_04EAB8:         db $04, $08, $19, $01, $0E, $0E, $19, $00
DATA_04EAC0:         db $0E, $0E, $19, $00, $0E, $0E, $18, $00
DATA_04EAC8:         db $0E, $0E, $18, $00, $0E, $0E, $19, $00
DATA_04EAD0:         db $0F, $0F, $1B, $01, $10, $10, $1C, $01
DATA_04EAD8:         db $10, $10, $1E, $02, $10, $10, $1E, $04
DATA_04EAE0:         db $11, $11, $1E, $04, $11, $11, $1E, $04
DATA_04EAE8:         db $11, $11, $1E, $03, $10, $10, $1E, $02
DATA_04EAF0:         db $10, $10, $1E, $02, $10, $10, $1E, $02
DATA_04EAF8:         db $0F, $0F, $1E, $02, $0F, $0F, $1E, $03
DATA_04EB00:         db $13, $19, $1E, $03, $12, $1A, $1F, $04
DATA_04EB08:         db $11, $1B, $1F, $05, $11, $1C, $1E, $09
DATA_04EB10:         db $10, $10, $11, $0A, $10, $10, $10, $0B
DATA_04EB18:         db $0C, $0E, $0F

DATA_04EB1B:         db $C0, $77, $15, $03, $10, $10, $1E, $02
DATA_04EB23:         db $10, $10, $1E, $02, $10, $10, $1F, $01
DATA_04EB2B:         db $0F, $0F, $1F, $01, $0F, $0F, $1F, $00
DATA_04EB33:         db $0F, $0F, $1E, $00, $0F, $0F, $1E, $00
DATA_04EB3B:         db $0F, $0F, $1F, $01, $0F, $0F, $1F, $01
DATA_04EB43:         db $0F, $0F, $1F, $02, $0F, $0F, $1E, $03
DATA_04EB4B:         db $0F, $0F, $1E, $05, $0F, $0F, $1D, $08
DATA_04EB53:         db $0F, $0F, $1C, $08, $0F, $0F, $1B, $08
DATA_04EB5B:         db $0F, $0F, $19, $09, $0E, $0E, $16, $09
DATA_04EB63:         db $0E, $0E, $14, $0A, $0E, $0E, $13, $0B
DATA_04EB6B:         db $0E, $0E, $12, $0C, $0D, $0F, $11

DATA_04EB72:         db $E0, $7F, $16, $00, $07, $09, $1D, $00
DATA_04EB7A:         db $14, $14, $1E, $00, $14, $14, $1F, $00
DATA_04EB82:         db $14, $14, $1F, $01, $14, $14, $1F, $01
DATA_04EB8A:         db $14, $14, $1F, $02, $14, $14, $1E, $01
DATA_04EB92:         db $13, $13, $1E, $01, $12, $12, $1D, $01
DATA_04EB9A:         db $11, $11, $1D, $01, $10, $10, $1D, $01
DATA_04EBA2:         db $0F, $0F, $1C, $02, $0F, $0F, $1C, $03
DATA_04EBAA:         db $0F, $0F, $1B, $05, $0F, $0F, $1A, $09
DATA_04EBB2:         db $0F, $0F, $19, $09, $0F, $0F, $17, $0A
DATA_04EBBA:         db $11, $13, $14, $13, $14, $14, $16, $13
DATA_04EBC2:         db $14, $14, $14, $13, $13, $15, $16, $13
DATA_04EBCA:         db $13, $13, $13

DATA_04EBCD:         db $20, $17, $18, $0A, $0E, $0E, $0F, $07
DATA_04EBD5:         db $0F, $0F, $13, $05, $15, $1C, $1D, $04
DATA_04EBDD:         db $17, $1B, $1D, $03, $18, $1B, $1D, $02
DATA_04EBE5:         db $12, $12, $1D, $02, $12, $12, $1E, $01
DATA_04EBED:         db $12, $12, $1F, $01, $12, $12, $1F, $01
DATA_04EBF5:         db $12, $12, $1F, $02, $12, $12, $1F, $02
DATA_04EBFD:         db $11, $11, $1D, $03, $19, $1B, $1E, $04
DATA_04EC05:         db $17, $1B, $1E, $06, $15, $1B, $1E, $09
DATA_04EC0D:         db $17, $1C, $1D, $09, $0F, $0F, $18, $09
DATA_04EC15:         db $0F, $0F, $17, $0A, $0F, $0F, $15, $0B
DATA_04EC1D:         db $0E, $0E, $14, $11, $12, $12, $13, $0F
DATA_04EC25:         db $12, $12, $13, $0F, $11, $11, $13, $0F
DATA_04EC2D:         db $10, $10, $12

DATA_04EC30:         db $A0, $1B, $18, $04, $11, $11, $19, $03
DATA_04EC38:         db $11, $11, $1A, $02, $11, $11, $19, $02
DATA_04EC40:         db $0C, $0E, $15, $02, $04, $06, $14, $05
DATA_04EC48:         db $11, $11, $14, $04, $12, $12, $14, $03
DATA_04EC50:         db $03, $05, $15, $02, $13, $13, $16, $02
DATA_04EC58:         db $13, $13, $16, $02, $17, $1A, $1D, $02
DATA_04EC60:         db $19, $1E, $1E, $03, $1B, $1E, $1E, $04
DATA_04EC68:         db $1D, $1F, $1F, $05, $1D, $1F, $1F, $06
DATA_04EC70:         db $1D, $1F, $1F, $06, $13, $18, $1F, $06
DATA_04EC78:         db $13, $1B, $1E, $06, $13, $1E, $1E, $07
DATA_04EC80:         db $13, $1A, $1D, $08, $0A, $0C, $13, $08
DATA_04EC88:         db $15, $17, $1B, $10, $11, $11, $13, $11
DATA_04EC90:         db $11, $11, $12

DATA_04EC93:         db $00, $3E, $1E, $0D, $11, $15, $19, $04
DATA_04EC9B:         db $12, $14, $1A, $04, $12, $14, $1A, $05
DATA_04ECA3:         db $12, $14, $1A, $06, $12, $14, $1A, $05
DATA_04ECAB:         db $11, $11, $1C, $05, $11, $11, $1C, $04
DATA_04ECB3:         db $11, $11, $1C, $03, $11, $11, $1C, $03
DATA_04ECBB:         db $11, $11, $1A, $03, $11, $11, $1A, $03
DATA_04ECC3:         db $11, $11, $1A, $03, $11, $11, $1A, $03
DATA_04ECCB:         db $11, $11, $1A, $02, $11, $11, $1A, $02
DATA_04ECD3:         db $11, $11, $1A, $02, $11, $11, $1A, $02
DATA_04ECDB:         db $15, $17, $1A, $02, $16, $18, $1A, $02
DATA_04ECE3:         db $15, $17, $1A, $02, $10, $10, $1A, $03
DATA_04ECEB:         db $0F, $0F, $1A, $07, $0E, $0E, $1B, $06
DATA_04ECF3:         db $0E, $0E, $1B, $06, $0F, $0F, $1B, $06
DATA_04ECFB:         db $0F, $0F, $1A, $06, $0F, $0F, $18, $06
DATA_04ED03:         db $0E, $0E, $0F, $07, $0D, $0D, $0E, $08
DATA_04ED0B:         db $0D, $0D, $0D

DATA_04ED0E:         db $80, $5F, $16, $0D, $0F, $0F, $12, $0B
DATA_04ED16:         db $0F, $0F, $14, $0A, $0F, $0F, $15, $09
DATA_04ED1E:         db $0F, $0F, $16, $09, $0F, $0F, $16, $09
DATA_04ED26:         db $0F, $0F, $16, $09, $0F, $0F, $15, $0A
DATA_04ED2E:         db $0F, $0F, $14, $08, $0F, $0F, $16, $06
DATA_04ED36:         db $0F, $0F, $19, $05, $0F, $0F, $1A, $04
DATA_04ED3E:         db $0F, $0F, $1B, $04, $0F, $0F, $1B, $04
DATA_04ED46:         db $0F, $0F, $1B, $05, $0F, $0F, $1A, $05
DATA_04ED4E:         db $0F, $0F, $1A, $06, $0F, $0F, $19, $07
DATA_04ED56:         db $0F, $0F, $18, $08, $0F, $0F, $17, $09
DATA_04ED5E:         db $0F, $0F, $16, $0B, $0F, $0F, $15, $0D
DATA_04ED66:         db $0F, $0F, $12

DATA_04ED69:         dw $EA98
DATA_04ED6B:         dw $EB1B
DATA_04ED6D:         dw $EB72
DATA_04ED6F:         dw $EC30
DATA_04ED71:         dw $EC93
DATA_04ED73:         dw $ED0E
DATA_04ED75:         dw $EBCD

DATA_04ED77:         dw $0000, $016B, $0178, $0181
DATA_04ED7F:         dw $0186, $0182, $0171, $000A
DATA_04ED87:         dw $0004, $03FF, $023F, $001F
DATA_04ED8F:         dw $4010, $7C00, $7E00, $47E0
DATA_04ED97:         dw $03F4, $03FF, $031F, $021F
DATA_04ED9F:         dw $011F, $001F, $2018, $4010
DATA_04EDA7:         dw $6008, $7C00, $7D00, $7E00
DATA_04EDAF:         dw $6300, $47E0, $23EA, $03F4
DATA_04EDB7:         dw $03FA, $000C, $0006

    LDA #$00FF          ; $04EDBD   |
    STA $61B0           ; $04EDC0   |
    STA $7E0A           ; $04EDC3   |
    LDY $614E           ; $04EDC6   |
    BNE CODE_04EDCC     ; $04EDC9   |
    RTS                 ; $04EDCB   |

CODE_04EDCC:
    DEY                 ; $04EDCC   |
    DEY                 ; $04EDCD   |
    DEY                 ; $04EDCE   |
    BPL CODE_04EDD4     ; $04EDCF   |
    JMP CODE_04EE63     ; $04EDD1   |

CODE_04EDD4:
    BNE CODE_04EE0E     ; $04EDD4   |
    LDA $70336C         ; $04EDD6   |
    CMP #$0020          ; $04EDDA   |
    BCC CODE_04EDF0     ; $04EDDD   |
    LDA #$FF80          ; $04EDDF   |

CODE_04EDE2:
    STA $0C86           ; $04EDE2   |
    LDA #$0000          ; $04EDE5   |
    STA $70336C         ; $04EDE8   |
    INC $614E           ; $04EDEC   |
    RTS                 ; $04EDEF   |

CODE_04EDF0:
    LDA #$2D6C          ; $04EDF0   |
    LDY #$2F6C          ; $04EDF3   |

CODE_04EDF6:
    STA $70336E         ; $04EDF6   |
    TYA                 ; $04EDFA   |
    STA $703370         ; $04EDFB   |
    SEP #$10            ; $04EDFF   |
    LDX #$08            ; $04EE01   |
    LDA #$B4A9          ; $04EE03   |
    JSL $7EDE44         ; $04EE06   | GSU init
    REP #$10            ; $04EE0A   |
    BRA CODE_04EE63     ; $04EE0C   |

CODE_04EE0E:
    DEY                 ; $04EE0E   |
    BNE CODE_04EE40     ; $04EE0F   |
    LDA #$0070          ; $04EE11   |\ play sound #$0070
    JSL $0085D2         ; $04EE14   |/
    SEP #$10            ; $04EE18   |
    LDA #$01C2          ; $04EE1A   |
    JSL $008B21         ; $04EE1D   |
    LDX $60C4           ; $04EE21   |
    LDA $608C           ; $04EE24   |
    CLC                 ; $04EE27   |
    ADC $EDB9,x         ; $04EE28   |
    STA $70A2,y         ; $04EE2B   |
    LDA $6090           ; $04EE2E   |
    STA $7142,y         ; $04EE31   |
    LDA #$00F0          ; $04EE34   |
    STA $7782,y         ; $04EE37   |
    REP #$10            ; $04EE3A   |
    INC $614E           ; $04EE3C   |
    RTS                 ; $04EE3F   |

CODE_04EE40:
    DEY                 ; $04EE40   |
    BNE CODE_04EE98     ; $04EE41   |
    LDA $0C86           ; $04EE43   |
    CMP #$0100          ; $04EE46   |
    BMI CODE_04EE57     ; $04EE49   |
    LDX $0C88           ; $04EE4B   |
    STX $0C8A           ; $04EE4E   |
    LDA #$0000          ; $04EE51   |
    JMP CODE_04EDE2     ; $04EE54   |

CODE_04EE57:
    LDA $0C86           ; $04EE57   |
    CLC                 ; $04EE5A   |
    ADC #$0002          ; $04EE5B   |
    STA $0C86           ; $04EE5E   |
    BPL CODE_04EE66     ; $04EE61   |

CODE_04EE63:
    LDA #$0000          ; $04EE63   |

CODE_04EE66:
    STA $3006           ; $04EE66   |
    LDX $0C8A           ; $04EE69   |
    LDA $ED69,x         ; $04EE6C   |
    STA $3002           ; $04EE6F   |
    LDX $0C88           ; $04EE72   |
    LDA $ED69,x         ; $04EE75   |
    STA $3004           ; $04EE78   |
    LDA #$0004          ; $04EE7B   |
    STA $3000           ; $04EE7E   |
    STZ $3008           ; $04EE81   |
    LDA #$0020          ; $04EE84   |
    STA $300A           ; $04EE87   |
    SEP #$10            ; $04EE8A   |
    LDX #$08            ; $04EE8C   |
    LDA #$BA44          ; $04EE8E   |
    JSL $7EDE44         ; $04EE91   | GSU init
    REP #$10            ; $04EE95   |

CODE_04EE97:
    RTS                 ; $04EE97   |

CODE_04EE98:
    LDA $70336C         ; $04EE98   |
    CMP #$0020          ; $04EE9C   |
    BCS CODE_04EEAD     ; $04EE9F   |
    LDA #$2F6C          ; $04EEA1   |
    LDY #$2D6C          ; $04EEA4   |
    JSR CODE_04EDF6     ; $04EEA7   |
    JMP CODE_04EE97     ; $04EEAA   |

CODE_04EEAD:
    LDA #$0000          ; $04EEAD   |
    STA $70336C         ; $04EEB0   |
    STZ $614E           ; $04EEB4   |
    STZ $61B0           ; $04EEB7   |
    LDA #$0000          ; $04EEBA   |
    STA $60AC           ; $04EEBD   |
    STZ $60B4           ; $04EEC0   |
    STZ $60A8           ; $04EEC3   |
    STZ $60AA           ; $04EEC6   |
    STZ $60D4           ; $04EEC9   |
    LDX $0C8A           ; $04EECC   |
    STX $60AE           ; $04EECF   |
    BEQ CODE_04EEDF     ; $04EED2   |
    LDA #$0500          ; $04EED4   |
    STA $61F4           ; $04EED7   |
    STZ $60C6           ; $04EEDA   |
    BRA CODE_04EEDF     ; $04EEDD   |

CODE_04EEDF:
    LDA $ED77,x         ; $04EEDF   |
    STA $60BE           ; $04EEE2   |
    JSL $04EF27         ; $04EEE5   |
    JMP ($EF47,x)       ; $04EEE9   |

    TXY                 ; $04EEEC   |
    STA $00             ; $04EEED   |
    ASL A               ; $04EEEF   |
    STA $02             ; $04EEF0   |
    STA $04             ; $04EEF2   |
    LDA #$6000          ; $04EEF4   |

CODE_04EEF7:
    STA $6128,x         ; $04EEF7   |
    CLC                 ; $04EEFA   |
    ADC #$0200          ; $04EEFB   |
    STA $612A,x         ; $04EEFE   |
    CLC                 ; $04EF01   |
    ADC #$0200          ; $04EF02   |
    INX                 ; $04EF05   |
    INX                 ; $04EF06   |
    INX                 ; $04EF07   |
    INX                 ; $04EF08   |
    DEC $00             ; $04EF09   |
    BNE CODE_04EF10     ; $04EF0B   |
    LDA #$6040          ; $04EF0D   |

CODE_04EF10:
    DEC $02             ; $04EF10   |
    BNE CODE_04EEF7     ; $04EF12   |
    SEP #$20            ; $04EF14   |
    LDA #$70            ; $04EF16   |
    TYX                 ; $04EF18   |

CODE_04EF19:
    STA $612A,x         ; $04EF19   |
    INX                 ; $04EF1C   |
    INX                 ; $04EF1D   |
    INX                 ; $04EF1E   |
    INX                 ; $04EF1F   |
    DEC $04             ; $04EF20   |
    BNE CODE_04EF19     ; $04EF22   |
    REP #$20            ; $04EF24   |
    RTS                 ; $04EF26   |

    PHP                 ; $04EF27   |
    REP #$30            ; $04EF28   |
    PHX                 ; $04EF2A   |
    STZ $60D4           ; $04EF2B   |
    STZ $60DE           ; $04EF2E   |
    STZ $61D0           ; $04EF31   |
    STZ $60C2           ; $04EF34   |
    STZ $60F8           ; $04EF37   |
    LDX #$002E          ; $04EF3A   |

CODE_04EF3D:
    STZ $617E,x         ; $04EF3D   |
    DEX                 ; $04EF40   |
    DEX                 ; $04EF41   |
    BPL CODE_04EF3D     ; $04EF42   |
    PLX                 ; $04EF44   |
    PLP                 ; $04EF45   |
    RTL                 ; $04EF46   |

DATA_04EF47:         dw $EF55
DATA_04EF49:         dw $EF5C
DATA_04EF4B:         dw $EFC3
DATA_04EF4D:         dw $EFB2
DATA_04EF4F:         dw $EFD3
DATA_04EF51:         dw $EF55
DATA_04EF53:         dw $EFBF

    RTS                 ; $04EF55   |

    JSR CODE_04EF5C     ; $04EF56   |
    JMP CODE_04EFA8     ; $04EF59   |

CODE_04EF5C:
    STZ $617E           ; $04EF5C   |
    STZ $6180           ; $04EF5F   |
    STZ $6182           ; $04EF62   |
    STZ $6184           ; $04EF65   |
    STZ $6186           ; $04EF68   |
    STZ $6188           ; $04EF6B   |
    STZ $6112           ; $04EF6E   |
    STZ $618A           ; $04EF71   |
    LDA #$0100          ; $04EF74   |
    STA $618C           ; $04EF77   |
    STZ $618E           ; $04EF7A   |
    STZ $6190           ; $04EF7D   |
    STZ $60FC           ; $04EF80   |
    STZ $6192           ; $04EF83   |
    STZ $6194           ; $04EF86   |
    STZ $6196           ; $04EF89   |
    STZ $619E           ; $04EF8C   |
    STZ $61A0           ; $04EF8F   |
    STZ $61A2           ; $04EF92   |
    STZ $61A4           ; $04EF95   |
    STZ $61A6           ; $04EF98   |
    STZ $61A8           ; $04EF9B   |
    STZ $61AA           ; $04EF9E   |
    STZ $61AC           ; $04EFA1   |
    STZ $61E4           ; $04EFA4   |
    RTS                 ; $04EFA7   |

CODE_04EFA8:
    STZ $6070           ; $04EFA8   |
    STZ $6072           ; $04EFAB   |
    JSR CODE_04F6A2     ; $04EFAE   |
    RTL                 ; $04EFB1   |
    STZ $617E           ; $04EFB2   |
    STZ $6182           ; $04EFB5   |
    STZ $6184           ; $04EFB8   |
    STZ $61F6           ; $04EFBB   |
    RTS                 ; $04EFBE   |

    STZ $617E           ; $04EFBF   |
    RTS                 ; $04EFC2   |
    STZ $617E           ; $04EFC3   |
    STZ $6182           ; $04EFC6   |
    STZ $6184           ; $04EFC9   |
    STZ $6180           ; $04EFCC   |
    STZ $618A           ; $04EFCF   |
    RTS                 ; $04EFD2   |

    LDA $60C4           ; $04EFD3   |
    BEQ CODE_04EFDB     ; $04EFD6   |
    LDA #$8000          ; $04EFD8   |

CODE_04EFDB:
    STA $617E           ; $04EFDB   |
    STZ $6180           ; $04EFDE   |
    STZ $618A           ; $04EFE1   |
    STZ $6184           ; $04EFE4   |
    STZ $6186           ; $04EFE7   |
    LDA #$0100          ; $04EFEA   |
    STA $6182           ; $04EFED   |
    RTS                 ; $04EFF0   |

CODE_04EFF1:
    LDA $61F4           ; $04EFF1   |
    SEC                 ; $04EFF4   |
    SBC #$0020          ; $04EFF5   |
    BCC CODE_04F00E     ; $04EFF8   |
    CMP #$00C0          ; $04EFFA   |
    BCS CODE_04F04C     ; $04EFFD   |
    INC A               ; $04EFFF   |
    AND #$003F          ; $04F000   |
    BNE CODE_04F04C     ; $04F003   |
    LDA #$007F          ; $04F005   |\ play sound #$007F
    JSL $0085D2         ; $04F008   |/
    BRA CODE_04F04C     ; $04F00C   |

CODE_04F00E:
    LDA #$0018          ; $04F00E   |
    STA $60AC           ; $04F011   |
    STZ $0C84           ; $04F014   |
    SEP #$10            ; $04F017   |
    LDA #$01E1          ; $04F019   |
    JSL $008B21         ; $04F01C   |
    TYX                 ; $04F020   |
    LDA $608C           ; $04F021   |
    CLC                 ; $04F024   |
    ADC #$0008          ; $04F025   |
    STA $70A2,x         ; $04F028   |
    LDA $6090           ; $04F02B   |
    CLC                 ; $04F02E   |
    ADC #$0014          ; $04F02F   |
    STA $7142,x         ; $04F032   |
    LDA #$000B          ; $04F035   |
    STA $7E4C,x         ; $04F038   |
    LDA #$00FF          ; $04F03B   |
    STA $7E4E,x         ; $04F03E   |
    STZ $73C2,x         ; $04F041   |
    LDA #$0002          ; $04F044   |
    STA $7782,x         ; $04F047   |
    REP #$10            ; $04F04A   |

CODE_04F04C:
    JMP CODE_04F690     ; $04F04C   |

CODE_04F04F:
    LDA $7FEA           ; $04F04F   |
    BEQ CODE_04F05D     ; $04F052   |
    ASL A               ; $04F054   |
    ASL A               ; $04F055   |
    ORA $7FEC           ; $04F056   |
    TAX                 ; $04F059   |
    JSR ($F05A,x)       ; $04F05A   |

CODE_04F05D:
    RTS                 ; $04F05D   |

DATA_04F05E:         dw $F094
DATA_04F060:         dw $F0F3
DATA_04F062:         dw $F1EE
DATA_04F064:         dw $F0F9
DATA_04F066:         dw $F0F3
DATA_04F068:         dw $F0AE
DATA_04F06A:         dw $F0F9
DATA_04F06C:         dw $F0AE
DATA_04F06E:         dw $F07A
DATA_04F070:         dw $F13B
DATA_04F072:         dw $0000
DATA_04F074:         dw $F094
DATA_04F076:         dw $0000
DATA_04F078:         dw $F07A

    STZ $7FEA           ; $04F07A   |
    LDA #$0000          ; $04F07D   |
    STA $70336C         ; $04F080   |
    STZ $61AE           ; $04F084   |
    STZ $61B0           ; $04F087   |
    LDA $7FEC           ; $04F08A   |
    EOR #$0002          ; $04F08D   |
    STA $7FEC           ; $04F090   |
    RTS                 ; $04F093   |

    JSR CODE_04F54B     ; $04F094   |
    LDA $70336C         ; $04F097   |
    INC A               ; $04F09B   |
    STA $70336C         ; $04F09C   |
    CMP #$0010          ; $04F0A0   |
    BCS CODE_04F0EF     ; $04F0A3   |
    RTS                 ; $04F0A5   |

DATA_04F0A6:         dw $6800, $6C00

DATA_04F0AA:         dw $65A6, $6DA6

    PHB                 ; $04F0AE   |\
    PEA $7E48           ; $04F0AF   | | data bank $7E
    PLB                 ; $04F0B2   | |
    PLB                 ; $04F0B3   |/
    LDY $4800           ; $04F0B4   |
    LDA $007FEA         ; $04F0B7   |
    ASL A               ; $04F0BB   |
    TAX                 ; $04F0BC   |
    LDA $04F0A0,x       ; $04F0BD   |
    STA $0000,y         ; $04F0C1   |
    LDA #$0080          ; $04F0C4   |
    STA $0002,y         ; $04F0C7   |
    LDA #$3981          ; $04F0CA   |
    STA $0003,y         ; $04F0CD   |
    LDA $04F0A4,x       ; $04F0D0   |
    STA $0005,y         ; $04F0D4   |
    LDA #$007E          ; $04F0D7   |
    STA $0007,y         ; $04F0DA   |
    LDA #$07C0          ; $04F0DD   |
    STA $0008,y         ; $04F0E0   |
    TXA                 ; $04F0E3   |
    CLC                 ; $04F0E4   |
    ADC #$000C          ; $04F0E5   |
    STA $000A,y         ; $04F0E8   |
    STA $4800           ; $04F0EB   |
    PLB                 ; $04F0EE   |

CODE_04F0EF:
    INC $7FEA           ; $04F0EF   |
    RTS                 ; $04F0F2   |

    BRA CODE_04F0EF     ; $04F0F3   |

DATA_04F0F5:         dw $0002, $FFFE

    LDX $7FEC           ; $04F0F9   |
    LDA $70336C         ; $04F0FC   |
    CLC                 ; $04F100   |
    ADC $F0F5,x         ; $04F101   |
    AND #$001E          ; $04F104   |
    STA $70336C         ; $04F107   |
    BEQ CODE_04F0EF     ; $04F10B   |
    BIT #$0002          ; $04F10D   |
    BNE CODE_04F13A     ; $04F110   |
    AND #$001C          ; $04F112   |
    LSR A               ; $04F115   |
    STA $00             ; $04F116   |
    LSR A               ; $04F118   |
    ADC $00             ; $04F119   |
    ASL A               ; $04F11B   |
    ADC #$0004          ; $04F11C   |
    TAX                 ; $04F11F   |
    PHB                 ; $04F120   |
    PEA $7020           ; $04F121   |
    PLB                 ; $04F124   |
    PLB                 ; $04F125   |
    LDY #$0004          ; $04F126   |

CODE_04F129:
    LDA $5FCB4A,x       ; $04F129   |
    STA $200A,y         ; $04F12D   |
    STA $2D76,y         ; $04F130   |
    DEX                 ; $04F133   |
    DEX                 ; $04F134   |
    DEY                 ; $04F135   |
    DEY                 ; $04F136   |
    BPL CODE_04F129     ; $04F137   |
    PLB                 ; $04F139   |

CODE_04F13A:
    RTS                 ; $04F13A   |

    PHB                 ; $04F13B   |\
    PEA $7E65           ; $04F13C   | | data bank $7E
    PLB                 ; $04F13F   | |
    PLB                 ; $04F140   |/
    LDX #$07BE          ; $04F141   |
    LDY #$03FE          ; $04F144   |

CODE_04F147:
    PHX                 ; $04F147   |
    LDA #$0010          ; $04F148   |
    STA $00             ; $04F14B   |
    STA $02             ; $04F14D   |

CODE_04F14F:
    PHY                 ; $04F14F   |
    LDA $6DA6,x         ; $04F150   |
    TAY                 ; $04F153   |
    AND #$03FF          ; $04F154   |
    CMP #$0180          ; $04F157   |
    BCC CODE_04F161     ; $04F15A   |
    CMP #$0200          ; $04F15C   |
    BCC CODE_04F166     ; $04F15F   |

CODE_04F161:
    LDA #$01CE          ; $04F161   |
    BRA CODE_04F16D     ; $04F164   |

CODE_04F166:
    TYA                 ; $04F166   |
    AND #$C07F          ; $04F167   |
    ORA #$2100          ; $04F16A   |

CODE_04F16D:
    PLY                 ; $04F16D   |
    STA $71A6,y         ; $04F16E   |
    STA $75A6,y         ; $04F171   |
    DEY                 ; $04F174   |
    DEY                 ; $04F175   |
    DEX                 ; $04F176   |
    DEX                 ; $04F177   |
    DEX                 ; $04F178   |
    DEX                 ; $04F179   |
    DEC $00             ; $04F17A   |
    BNE CODE_04F14F     ; $04F17C   |
    PLX                 ; $04F17E   |

CODE_04F17F:
    PHY                 ; $04F17F   |
    LDA $65A6,x         ; $04F180   |
    TAY                 ; $04F183   |
    AND #$03FF          ; $04F184   |
    CMP #$0180          ; $04F187   |
    BCC CODE_04F191     ; $04F18A   |
    CMP #$0200          ; $04F18C   |
    BCC CODE_04F196     ; $04F18F   |

CODE_04F191:
    LDA #$01CE          ; $04F191   |
    BRA CODE_04F19D     ; $04F194   |

CODE_04F196:
    TYA                 ; $04F196   |
    AND #$C07F          ; $04F197   |
    ORA #$2100          ; $04F19A   |

CODE_04F19D:
    PLY                 ; $04F19D   |
    STA $71A6,y         ; $04F19E   |
    STA $75A6,y         ; $04F1A1   |
    DEY                 ; $04F1A4   |
    DEY                 ; $04F1A5   |
    DEX                 ; $04F1A6   |
    DEX                 ; $04F1A7   |
    DEX                 ; $04F1A8   |
    DEX                 ; $04F1A9   |
    DEC $02             ; $04F1AA   |
    BNE CODE_04F17F     ; $04F1AC   |
    TXA                 ; $04F1AE   |
    AND #$FFBF          ; $04F1AF   |
    TAX                 ; $04F1B2   |
    BPL CODE_04F147     ; $04F1B3   |
    PLB                 ; $04F1B5   |
    LDA #$A618          ; $04F1B6   |
    LDY #$7E71          ; $04F1B9   |
    PHB                 ; $04F1BC   |\
    PEA $7E48           ; $04F1BD   | | data bank $7E
    PLB                 ; $04F1C0   | |
    PLB                 ; $04F1C1   |/
    LDX $4800           ; $04F1C2   |
    STA $0004,x         ; $04F1C5   |
    TYA                 ; $04F1C8   |
    STA $0006,x         ; $04F1C9   |
    LDA #$3400          ; $04F1CC   |
    STA $0000,x         ; $04F1CF   |
    LDA #$0180          ; $04F1D2   |
    STA $0002,x         ; $04F1D5   |
    LDA #$0800          ; $04F1D8   |
    STA $0008,x         ; $04F1DB   |
    TXA                 ; $04F1DE   |
    CLC                 ; $04F1DF   |
    ADC #$000C          ; $04F1E0   |
    STA $000A,x         ; $04F1E3   |
    STA $4800           ; $04F1E6   |
    PLB                 ; $04F1E9   |

CODE_04F1EA:
    INC $7FEA           ; $04F1EA   |
    RTS                 ; $04F1ED   |

    BRA CODE_04F1EA     ; $04F1EE   |

DATA_04F1F0:         dw $0FFE, $07FE, $0FFE

    LDA $61AE           ; $04F1F6   |
    ORA $61B0           ; $04F1F9   |
    ORA $0398           ; $04F1FC   |
    ORA $7E2A           ; $04F1FF   |
    BEQ CODE_04F205     ; $04F202   |
    RTL                 ; $04F204   |

CODE_04F205:
    LDA #$0004          ; $04F205   |\ play sound #$0004
    JSL $0085D2         ; $04F208   |/
    INC $7FEA           ; $04F20C   |
    LDX $7FEC           ; $04F20F   |
    PHB                 ; $04F212   |\
    PEA $7058           ; $04F213   | | data bank $70
    PLB                 ; $04F216   | |
    PLB                 ; $04F217   |/
    PHX                 ; $04F218   |
    LDA $04F1F2,x       ; $04F219   |
    TAX                 ; $04F21D   |
    LDY #$07FE          ; $04F21E   |

CODE_04F221:
    STZ $6800,x         ; $04F221   |
    DEX                 ; $04F224   |
    DEX                 ; $04F225   |
    DEY                 ; $04F226   |
    DEY                 ; $04F227   |
    BPL CODE_04F221     ; $04F228   |
    PLX                 ; $04F22A   |
    LDA $04F1F0,x       ; $04F22B   |
    TAY                 ; $04F22F   |
    LDX #$07FE          ; $04F230   |

CODE_04F233:
    LDA $7E5DA6,x       ; $04F233   |
    STA $6800,y         ; $04F237   |
    DEY                 ; $04F23A   |
    DEY                 ; $04F23B   |
    DEX                 ; $04F23C   |
    DEX                 ; $04F23D   |
    BPL CODE_04F233     ; $04F23E   |
    PLB                 ; $04F240   |
    LDA #$0001          ; $04F241   |
    STA $61AE           ; $04F244   |
    STA $61B0           ; $04F247   |
    RTL                 ; $04F24A   |

DATA_04F24B:         db $00, $07, $01, $06, $00, $07, $02, $05
DATA_04F253:         db $01, $06, $00, $07, $03, $04, $02, $05
DATA_04F25B:         db $01, $06, $00, $07, $04, $03, $03, $04
DATA_04F263:         db $02, $05, $01, $06, $00, $07, $05, $02
DATA_04F26B:         db $04, $03, $03, $04, $02, $05, $01, $06
DATA_04F273:         db $00, $07, $06, $01, $05, $02, $04, $03
DATA_04F27B:         db $03, $04, $02, $05, $01, $06, $00, $07
DATA_04F283:         db $07, $00, $06, $01, $05, $02, $04, $03
DATA_04F28B:         db $00, $01, $02, $03, $04, $05, $06, $07
DATA_04F293:         db $07, $07, $07, $07, $07, $07, $07, $06
DATA_04F29B:         db $05, $04, $03, $02, $01, $00, $00, $00
DATA_04F2A3:         db $00, $00, $00, $00, $01, $02, $03, $04
DATA_04F2AB:         db $05, $06, $06, $06, $06, $06, $06, $05
DATA_04F2B3:         db $04, $03, $02, $01, $01, $01, $01, $01
DATA_04F2BB:         db $02, $03, $04, $05, $05, $05, $05, $04
DATA_04F2C3:         db $03, $02, $02, $02, $03, $04, $04, $03
DATA_04F2CB:         db $00, $05, $02, $04, $03, $07, $01, $06
DATA_04F2D3:         db $02, $04, $01, $06, $00, $05, $04, $05
DATA_04F2DB:         db $03, $06, $03, $07, $00, $03, $04, $07
DATA_04F2E3:         db $01, $05, $01, $05, $00, $06, $01, $07
DATA_04F2EB:         db $02, $05, $03, $07, $02, $03, $03, $07
DATA_04F2F3:         db $01, $07, $02, $06, $02, $06, $00, $05
DATA_04F2FB:         db $02, $04, $02, $05, $00, $04, $01, $04
DATA_04F303:         db $00, $07, $03, $06, $00, $04, $01, $06
DATA_04F30B:         db $00, $01, $02, $03, $04, $05, $06, $07
DATA_04F313:         db $07, $07, $07, $07, $07, $07, $07, $06
DATA_04F31B:         db $05, $04, $03, $02, $01, $01, $01, $01
DATA_04F323:         db $01, $01, $02, $03, $04, $05, $05, $05
DATA_04F32B:         db $05, $04, $03, $03, $04, $04, $03, $02
DATA_04F333:         db $02, $02, $02, $03, $04, $05, $06, $06
DATA_04F33B:         db $06, $06, $06, $06, $05, $04, $03, $02
DATA_04F343:         db $01, $00, $00, $00, $00, $00, $00, $00
DATA_04F34B:         db $03, $04, $00, $00, $03, $04, $07, $07
DATA_04F353:         db $02, $05, $00, $00, $02, $05, $07, $07
DATA_04F35B:         db $03, $04, $01, $01, $03, $04, $06, $06
DATA_04F363:         db $01, $06, $00, $00, $01, $06, $07, $07
DATA_04F36B:         db $02, $05, $01, $01, $02, $05, $06, $06
DATA_04F373:         db $03, $04, $02, $02, $03, $04, $05, $05
DATA_04F37B:         db $00, $07, $00, $07, $01, $06, $01, $06
DATA_04F383:         db $02, $05, $02, $05, $03, $04, $03, $04
DATA_04F38B:         db $03, $04, $00, $07, $03, $04, $00, $07
DATA_04F393:         db $02, $05, $01, $06, $03, $04, $00, $07
DATA_04F39B:         db $02, $05, $01, $06, $03, $04, $00, $07
DATA_04F3A3:         db $01, $06, $02, $05, $02, $05, $01, $06
DATA_04F3AB:         db $03, $04, $00, $07, $01, $06, $02, $05
DATA_04F3B3:         db $02, $05, $01, $06, $03, $04, $00, $07
DATA_04F3BB:         db $00, $07, $00, $07, $01, $06, $01, $06
DATA_04F3C3:         db $02, $05, $02, $05, $03, $04, $03, $04

DATA_04F3CB:         db $00, $07, $00, $07, $01, $06, $00, $07
DATA_04F3D3:         db $01, $06, $02, $05, $00, $07, $01, $06
DATA_04F3DB:         db $02, $05, $03, $04, $00, $07, $01, $06
DATA_04F3E3:         db $02, $05, $03, $04, $04, $03, $00, $07
DATA_04F3EB:         db $01, $06, $02, $05, $03, $04, $04, $03
DATA_04F3F3:         db $05, $02, $00, $07, $01, $06, $02, $05
DATA_04F3FB:         db $03, $04, $04, $03, $05, $02, $06, $01
DATA_04F403:         db $00, $07, $01, $06, $02, $05, $03, $04
DATA_04F40B:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_04F413:         db $01, $02, $03, $04, $05, $06, $07, $07
DATA_04F41B:         db $07, $07, $07, $07, $07, $07, $06, $05
DATA_04F423:         db $04, $03, $02, $01, $01, $01, $01, $01
DATA_04F42B:         db $01, $01, $02, $03, $04, $05, $06, $06
DATA_04F433:         db $06, $06, $06, $06, $05, $04, $03, $02
DATA_04F43B:         db $02, $02, $02, $02, $03, $04, $05, $05
DATA_04F443:         db $05, $05, $04, $03, $03, $03, $04, $04
DATA_04F44B:         db $02, $05, $05, $01, $03, $07, $07, $03
DATA_04F453:         db $01, $06, $04, $01, $00, $02, $04, $00
DATA_04F45B:         db $00, $06, $07, $04, $05, $02, $05, $02
DATA_04F463:         db $02, $07, $06, $03, $03, $07, $01, $03
DATA_04F46B:         db $04, $01, $06, $01, $00, $04, $01, $05
DATA_04F473:         db $05, $00, $06, $00, $03, $05, $07, $04
DATA_04F47B:         db $07, $02, $02, $06, $01, $03, $03, $07
DATA_04F483:         db $04, $06, $05, $02, $06, $00, $00, $04
DATA_04F48B:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_04F493:         db $01, $02, $03, $04, $05, $06, $07, $07
DATA_04F49B:         db $07, $07, $07, $07, $07, $06, $05, $04
DATA_04F4A3:         db $03, $02, $02, $02, $02, $02, $03, $04
DATA_04F4AB:         db $05, $05, $05, $04, $04, $03, $03, $03
DATA_04F4B3:         db $04, $05, $06, $06, $06, $06, $06, $05
DATA_04F4BB:         db $04, $03, $02, $01, $01, $01, $01, $01
DATA_04F4C3:         db $01, $01, $02, $03, $04, $05, $06, $07
DATA_04F4CB:         db $00, $00, $03, $04, $07, $07, $03, $04
DATA_04F4D3:         db $00, $00, $02, $05, $07, $07, $02, $05
DATA_04F4DB:         db $01, $01, $03, $04, $06, $06, $03, $04
DATA_04F4E3:         db $00, $00, $01, $06, $07, $07, $01, $06
DATA_04F4EB:         db $01, $01, $02, $05, $06, $06, $02, $05
DATA_04F4F3:         db $02, $02, $03, $04, $05, $05, $03, $04
DATA_04F4FB:         db $00, $07, $07, $00, $01, $06, $06, $01
DATA_04F503:         db $02, $05, $05, $02, $03, $04, $04, $03
DATA_04F50B:         db $00, $00, $07, $07, $01, $01, $06, $06
DATA_04F513:         db $00, $00, $07, $07, $02, $02, $05, $05
DATA_04F51B:         db $01, $01, $06, $06, $03, $03, $04, $04
DATA_04F523:         db $00, $00, $07, $07, $02, $02, $05, $05
DATA_04F52B:         db $04, $04, $03, $03, $01, $01, $06, $06
DATA_04F533:         db $03, $03, $04, $04, $05, $05, $02, $02
DATA_04F53B:         db $00, $00, $01, $01, $02, $02, $03, $03
DATA_04F543:         db $04, $04, $05, $05, $06, $06, $07, $07

CODE_04F54B:
    SEP #$10            ; $04F54B   |
    LDY $012D           ; $04F54D   |
    PHY                 ; $04F550   |
    LDY #$1A            ; $04F551   |
    STY $012D           ; $04F553   |
    LDY $012E           ; $04F556   |
    PHY                 ; $04F559   |
    LDY #$3C            ; $04F55A   |
    STY $012E           ; $04F55C   |
    LDX #$08            ; $04F55F   |
    REP #$10            ; $04F561   |
    LDA $70336C         ; $04F563   |
    ASL A               ; $04F567   |
    ASL A               ; $04F568   |
    TAY                 ; $04F569   |

CODE_04F56A:
    LDA $F24B,y         ; $04F56A   |
    AND #$00FF          ; $04F56D   |
    STA $6000           ; $04F570   |
    LDA $F3CB,y         ; $04F573   |
    AND #$00FF          ; $04F576   |
    STA $6002           ; $04F579   |
    PHY                 ; $04F57C   |
    SEP #$10            ; $04F57D   |
    LDA #$BCE0          ; $04F57F   |
    JSL $7EDE44         ; $04F582   | GSU init
    REP #$10            ; $04F586   |
    PLY                 ; $04F588   |
    INY                 ; $04F589   |
    TYA                 ; $04F58A   |
    AND #$0003          ; $04F58B   |
    BNE CODE_04F56A     ; $04F58E   |
    PHB                 ; $04F590   |
    PEA $7E48           ; $04F591   |
    PLB                 ; $04F594   |
    PLB                 ; $04F595   |
    LDX $4800           ; $04F596   |
    LDA #$2800          ; $04F599   |
    STA $0000,x         ; $04F59C   |
    LDA #$0180          ; $04F59F   |
    STA $0002,x         ; $04F5A2   |
    LDA #$0018          ; $04F5A5   |
    STA $0004,x         ; $04F5A8   |
    LDA #$7070          ; $04F5AB   |
    STA $0006,x         ; $04F5AE   |
    LDA #$0800          ; $04F5B1   |
    STA $0008,x         ; $04F5B4   |
    TXA                 ; $04F5B7   |
    CLC                 ; $04F5B8   |
    ADC #$000C          ; $04F5B9   |
    STA $000A,x         ; $04F5BC   |
    STA $4800           ; $04F5BF   |
    PLB                 ; $04F5C2   |
    SEP #$10            ; $04F5C3   |
    PLY                 ; $04F5C5   |
    STY $012E           ; $04F5C6   |
    PLY                 ; $04F5C9   |
    STY $012D           ; $04F5CA   |
    REP #$10            ; $04F5CD   |
    RTS                 ; $04F5CF   |

DATA_04F5D0:         dw $053D, $0063, $0470, $0078
DATA_04F5D8:         dw $BB74, $007A, $04CF, $004D
DATA_04F5E0:         dw $12BF, $0461, $0D7F, $0042
DATA_04F5E8:         dw $0682, $0064, $0D86, $0078
DATA_04F5F0:         dw $0A8A, $007A, $03C4, $054B
DATA_04F5F8:         dw $49CC, $0264, $04DD, $007A

CODE_04F600:
    LDA $0035           ; $04F600   |
    CMP #$00F0          ; $04F603   |
    BNE CODE_04F64B     ; $04F606   |
    LDA $021A           ; $04F608   |

CODE_04F60B:
    CMP #$000C          ; $04F60B   |
    BCC CODE_04F615     ; $04F60E   |
    SBC #$000C          ; $04F610   |
    BRA CODE_04F60B     ; $04F613   |

CODE_04F615:
    CMP #$0003          ; $04F615   |
    BEQ CODE_04F61F     ; $04F618   |
    CMP #$0007          ; $04F61A   |
    BNE CODE_04F64B     ; $04F61D   |

CODE_04F61F:
    AND #$0004          ; $04F61F   |
    LSR A               ; $04F622   |
    LSR A               ; $04F623   |
    ORA $0218           ; $04F624   |
    ASL A               ; $04F627   |
    ASL A               ; $04F628   |
    TAX                 ; $04F629   |
    LDA $F5D0,x         ; $04F62A   |
    STA $7F7E00         ; $04F62D   |
    LDA $F5D2,x         ; $04F631   |
    STA $7F7E02         ; $04F634   |
    STZ $038E           ; $04F638   |
    LDA #$0001          ; $04F63B   |
    STA $038C           ; $04F63E   |
    LDA #$000B          ; $04F641   |
    STA $0118           ; $04F644   |
    JSL $01B2B7         ; $04F647   |

CODE_04F64B:
    RTS                 ; $04F64B   |

    BRA CODE_04F673     ; $04F64C   |

    JSR CODE_04F600     ; $04F64E   |
    LDA $35             ; $04F651   |
    AND #$0030          ; $04F653   |
    BEQ CODE_04F668     ; $04F656   |
    LDA $38             ; $04F658   |
    AND #$0008          ; $04F65A   |
    BEQ CODE_04F668     ; $04F65D   |
    LDA $10DA           ; $04F65F   |
    EOR #$0001          ; $04F662   |
    STA $10DA           ; $04F665   |

CODE_04F668:
    LDA $10DA           ; $04F668   |
    BEQ CODE_04F673     ; $04F66B   |
    STZ $61B6           ; $04F66D   |
    JMP CODE_04F718     ; $04F670   |

CODE_04F673:
    LDA $60B2           ; $04F673   |
    CMP #$0140          ; $04F676   |
    BMI CODE_04F688     ; $04F679   |
    LDA $7E2A           ; $04F67B   |
    BNE CODE_04F688     ; $04F67E   |
    LDA #$001A          ; $04F680   |
    JSL $04F6CA         ; $04F683   |
    RTS                 ; $04F687   |

CODE_04F688:
    LDA $0C8A           ; $04F688   |
    BEQ CODE_04F690     ; $04F68B   |
    JMP CODE_04EFF1     ; $04F68D   |

CODE_04F690:
    LDA $35             ; $04F690   |
    LDY $0CCC           ; $04F692   |
    BEQ CODE_04F69A     ; $04F695   |
    AND #$FCFF          ; $04F697   |

CODE_04F69A:
    STA $6070           ; $04F69A   |
    LDA $37             ; $04F69D   |
    STA $6072           ; $04F69F   |

CODE_04F6A2:
    STZ $6076           ; $04F6A2   |
    STZ $607A           ; $04F6A5   |
    LDA $0136           ; $04F6A8   |
    STA $607C           ; $04F6AB   |
    SEP #$10            ; $04F6AE   |
    LDX #$0B            ; $04F6B0   |
    LDA #$C71B          ; $04F6B2   |
    JSL $7EDECF         ; $04F6B5   | GSU init
    LDA $6076           ; $04F6B9   |
    STA $51             ; $04F6BC   |
    LDA $607A           ; $04F6BE   |
    BEQ CODE_04F6C7     ; $04F6C1   |
    JSL $0085D2         ; $04F6C3   |

CODE_04F6C7:
    REP #$10            ; $04F6C7   |
    RTS                 ; $04F6C9   |

    JSL $04F6E2         ; $04F6CA   |
    LDA #$0011          ; $04F6CE   |
    STA $0118           ; $04F6D1   |
    STA $61B0           ; $04F6D4   |
    STZ $0B4C           ; $04F6D7   |
    SEP #$20            ; $04F6DA   |
    STZ $0D21           ; $04F6DC   |
    REP #$20            ; $04F6DF   |
    RTL                 ; $04F6E1   |

    STA $60AC           ; $04F6E2   |
    STA $61B0           ; $04F6E5   |
    STZ $61D6           ; $04F6E8   |
    LDA #$0007          ; $04F6EB   |
    STA $004D           ; $04F6EE   |
    LDA $021A           ; $04F6F1   |
    CMP #$000B          ; $04F6F4   |
    BEQ CODE_04F707     ; $04F6F7   |
    DEC $0379           ; $04F6F9   |
    LDA $037D           ; $04F6FC   |
    CMP #$03E7          ; $04F6FF   |
    BCS CODE_04F707     ; $04F702   |
    INC $037D           ; $04F704   |

CODE_04F707:
    RTL                 ; $04F707   |

DATA_04F708:         dw $0000, $0000, $0001, $0004
DATA_04F710:         dw $FFFF, $FFFC, $FFFF, $FFFC

CODE_04F718:
    STZ $60C0           ; $04F718   |
    LDA $36             ; $04F71B   |
    AND #$0003          ; $04F71D   |
    ASL A               ; $04F720   |
    BIT $34             ; $04F721   |
    BPL CODE_04F726     ; $04F723   |
    INC A               ; $04F725   |

CODE_04F726:
    ASL A               ; $04F726   |
    TAX                 ; $04F727   |
    LDA $608C           ; $04F728   |
    CLC                 ; $04F72B   |
    ADC $F708,x         ; $04F72C   |
    STA $608C           ; $04F72F   |
    LDA $36             ; $04F732   |
    AND #$000C          ; $04F734   |
    LSR A               ; $04F737   |
    BIT $34             ; $04F738   |
    BPL CODE_04F73D     ; $04F73A   |
    INC A               ; $04F73C   |

CODE_04F73D:
    ASL A               ; $04F73D   |
    TAX                 ; $04F73E   |
    LDA $6090           ; $04F73F   |
    CLC                 ; $04F742   |
    ADC $F708,x         ; $04F743   |
    STA $6090           ; $04F746   |
    RTS                 ; $04F749   |

; l sub
    STZ $60DE           ; $04F74A   |
    STZ $60D4           ; $04F74D   |
    PHX                 ; $04F750   |
    LDX $6162           ; $04F751   |
    BNE CODE_04F75D     ; $04F754   |
    LDX $6168           ; $04F756   |
    BEQ CODE_04F79D     ; $04F759   |
    BRA CODE_04F7A0     ; $04F75B   |

CODE_04F75D:
    LDA $6152           ; $04F75D   |
    ORA $6154           ; $04F760   |
    BNE CODE_04F774     ; $04F763   |
    LDA $6168           ; $04F765   |
    BEQ CODE_04F794     ; $04F768   |
    LDA $616A           ; $04F76A   |
    BEQ CODE_04F7AC     ; $04F76D   |
    STZ $616C           ; $04F76F   |
    BRA CODE_04F79D     ; $04F772   |

CODE_04F774:
    DEX                 ; $04F774   |
    BNE CODE_04F77C     ; $04F775   |
    LDA $0B57           ; $04F777   |
    BNE CODE_04F794     ; $04F77A   |

CODE_04F77C:
    JSL $039D68         ; $04F77C   |
    LDA $6FA2,x         ; $04F780   |
    AND #$6000          ; $04F783   |
    CMP #$6000          ; $04F786   |
    BNE CODE_04F794     ; $04F789   |
    LDA $7542,x         ; $04F78B   |
    BNE CODE_04F794     ; $04F78E   |
    JSL $048066         ; $04F790   |

CODE_04F794:
    STZ $6162           ; $04F794   |
    STZ $6168           ; $04F797   |
    STZ $616A           ; $04F79A   |

CODE_04F79D:
    STZ $6150           ; $04F79D   |

CODE_04F7A0:
    STZ $6152           ; $04F7A0   |
    STZ $6154           ; $04F7A3   |
    STZ $615E           ; $04F7A6   |
    STZ $6160           ; $04F7A9   |

CODE_04F7AC:
    PLX                 ; $04F7AC   |
    RTL                 ; $04F7AD   |

DATA_04F7AE:         dw $0080, $0005, $0002, $0002
DATA_04F7B6:         dw $0002, $000C, $0006, $0006
DATA_04F7BE:         dw $0006, $0006, $0006, $0006
DATA_04F7C6:         dw $0004, $0004, $0004, $0004
DATA_04F7CE:         dw $0004, $0004, $0003, $0003
DATA_04F7D6:         dw $0003, $0003, $0003, $0003
DATA_04F7DE:         dw $0002, $0002, $0002, $0002
DATA_04F7E6:         dw $0002

DATA_04F7E8:         dw $006E, $006D, $006E, $006D
DATA_04F7F0:         dw $006C, $006F, $0074, $0073
DATA_04F7F8:         dw $0072, $0071, $0070, $006F

DATA_04F800:         db $E2, $10, $22, $4A, $F7, $04

    REP #$10            ; $04F806   |
    LDX $60F8           ; $04F808   |
    LDA $61D2           ; $04F80B   |
    BNE CODE_04F82D     ; $04F80E   |
    DEX                 ; $04F810   |
    DEX                 ; $04F811   |
    BPL CODE_04F81C     ; $04F812   |
    JSL $04F6CE         ; $04F814   |
    INC $61AE           ; $04F818   |
    RTS                 ; $04F81B   |

CODE_04F81C:
    STX $60F8           ; $04F81C   |
    LDA $F7AE,x         ; $04F81F   |
    CPX #$003A          ; $04F822   |
    BCC CODE_04F82A     ; $04F825   |
    LDA #$0001          ; $04F827   |

CODE_04F82A:
    STA $61D2           ; $04F82A   |

CODE_04F82D:
    CPX #$000C          ; $04F82D   |
    BCC CODE_04F83F     ; $04F830   |
    TXA                 ; $04F832   |
    SBC #$000C          ; $04F833   |

CODE_04F836:
    SBC #$000C          ; $04F836   |
    BCS CODE_04F836     ; $04F839   |
    ADC #$0018          ; $04F83B   |
    TAX                 ; $04F83E   |

CODE_04F83F:
    LDA $F7E8,x         ; $04F83F   |
    STA $60BE           ; $04F842   |
    RTS                 ; $04F845   |

    STZ $611A           ; $04F846   |
    RTS                 ; $04F849   |

    STZ $6070           ; $04F84A   |
    STZ $6072           ; $04F84D   |
    SEP #$10            ; $04F850   |
    LDX #$0B            ; $04F852   |
    LDA #$C6E7          ; $04F854   |
    JSL $7EDECF         ; $04F857   | GSU init
    REP #$10            ; $04F85B   |
    RTS                 ; $04F85D   |

DATA_04F85E:         dw $FFFC, $0004, $FFFC, $0004

DATA_04F866:         dw $FFFC, $FFFC, $0004, $0004

DATA_04F86E:         dw $FF00, $0100, $FF80, $0080

DATA_04F876:         dw $FD00, $FD00, $FE00, $FE00

DATA_04F87E:         dw $0000, $0040, $0080, $00C0

DATA_04F886:         dw $0010, $0010, $0001, $0001

    LDX #$06            ; $04F88E   |

CODE_04F890:
    LDA #$01BD          ; $04F890   |
    JSL $008B21         ; $04F893   |
    LDA $0000           ; $04F897   |
    CLC                 ; $04F89A   |
    ADC $04F85E,x       ; $04F89B   |
    STA $70A2,y         ; $04F89F   |
    LDA $0002           ; $04F8A2   |
    CLC                 ; $04F8A5   |
    ADC $04F866,x       ; $04F8A6   |
    STA $7142,y         ; $04F8AA   |
    LDA $04F86E,x       ; $04F8AD   |
    STA $71E0,y         ; $04F8B1   |
    LDA $04F876,x       ; $04F8B4   |
    STA $71E2,y         ; $04F8B8   |
    LDA $0004           ; $04F8BB   |
    ORA $04F87E,x       ; $04F8BE   |
    STA $7002,y         ; $04F8C2   |
    LDA $04F886,x       ; $04F8C5   |
    STA $7782,y         ; $04F8C9   |
    DEX                 ; $04F8CC   |
    DEX                 ; $04F8CD   |
    BPL CODE_04F890     ; $04F8CE   |
    RTL                 ; $04F8D0   |

DATA_04F8D1:         dw $007D, $007E, $007F, $0080
DATA_04F8D9:         dw $0081, $0082, $0083, $0084
DATA_04F8E1:         dw $0085, $0086, $0110, $0111
DATA_04F8E9:         dw $0112, $0113, $0114, $0115

    LDA $60C0           ; $04F8F1   |
    BEQ CODE_04F8F9     ; $04F8F4   |
    JMP CODE_04F998     ; $04F8F6   |

CODE_04F8F9:
    LDY $60F8           ; $04F8F9   |
    LDA $61D2           ; $04F8FC   |
    BNE CODE_04F968     ; $04F8FF   |
    INY                 ; $04F901   |
    INY                 ; $04F902   |
    LDA $0C8C           ; $04F903   |
    BEQ CODE_04F915     ; $04F906   |
    STZ $0E15           ; $04F908   |
    CPY #$0020          ; $04F90B   |
    BCC CODE_04F921     ; $04F90E   |
    LDY #$0014          ; $04F910   |
    BRA CODE_04F921     ; $04F913   |

CODE_04F915:
    INC A               ; $04F915   |
    STA $0E15           ; $04F916   |
    CPY #$0014          ; $04F919   |
    BCC CODE_04F921     ; $04F91C   |
    LDY #$0004          ; $04F91E   |

CODE_04F921:
    STY $60F8           ; $04F921   |
    LDA #$0006          ; $04F924   |
    CPY #$0004          ; $04F927   |
    BCS CODE_04F965     ; $04F92A   |
    PHY                 ; $04F92C   |
    LDA #$2D6C          ; $04F92D   |
    STA $3002           ; $04F930   |
    LDA #$2F6C          ; $04F933   |
    STA $3004           ; $04F936   |
    LDA #$0200          ; $04F939   |
    STA $3018           ; $04F93C   |
    SEP #$10            ; $04F93F   |
    LDX #$08            ; $04F941   |
    LDA #$AA7F          ; $04F943   |
    JSL $7EDE44         ; $04F946   | GSU init
    REP #$10            ; $04F94A   |
    PLY                 ; $04F94C   |
    LDX #$001C          ; $04F94D   |
    LDA #$0000          ; $04F950   |

CODE_04F953:
    STA $70310E,x       ; $04F953   |
    DEX                 ; $04F957   |
    DEX                 ; $04F958   |
    BPL CODE_04F953     ; $04F959   |
    LDA #$FFFF          ; $04F95B   |
    STA $70336C         ; $04F95E   |
    LDA #$0004          ; $04F962   |

CODE_04F965:
    STA $61D2           ; $04F965   |

CODE_04F968:
    LDA $F8D1,y         ; $04F968   |
    STA $60BE           ; $04F96B   |
    CPY #$0004          ; $04F96E   |
    BCC CODE_04F997     ; $04F971   |
    LDA $70336C         ; $04F973   |
    CMP #$0020          ; $04F977   |
    BPL CODE_04F998     ; $04F97A   |
    LDA #$2D6C          ; $04F97C   |
    STA $70336E         ; $04F97F   |
    LDA #$2F6C          ; $04F983   |
    STA $703370         ; $04F986   |
    SEP #$10            ; $04F98A   |
    LDX #$08            ; $04F98C   |
    LDA #$B4A9          ; $04F98E   |
    JSL $7EDE44         ; $04F991   | GSU init
    REP #$10            ; $04F995   |

CODE_04F997:
    RTS                 ; $04F997   |

CODE_04F998:
    LDA $6104           ; $04F998   |
    CMP #$0100          ; $04F99B   |
    BEQ CODE_04F9AD     ; $04F99E   |
    SEP #$30            ; $04F9A0   |
    JSR CODE_04FA33     ; $04F9A2   |
    REP #$30            ; $04F9A5   |
    BEQ CODE_04F9B2     ; $04F9A7   |
    STZ $6104           ; $04F9A9   |
    RTS                 ; $04F9AC   |

CODE_04F9AD:
    JSL $02A4B5         ; $04F9AD   |
    RTS                 ; $04F9B1   |

CODE_04F9B2:
    LDA #$0200          ; $04F9B2   |
    STA $6104           ; $04F9B5   |
    STZ $60B4           ; $04F9B8   |
    LDA $60AE           ; $04F9BB   |
    BNE CODE_04FA22     ; $04F9BE   |
    LDA $0C8C           ; $04F9C0   |
    BEQ CODE_04FA21     ; $04F9C3   |
    LDA #$000E          ; $04F9C5   |
    STA $60AE           ; $04F9C8   |
    JSL $04EF27         ; $04F9CB   |
    LDA #$000A          ; $04F9CF   |
    STA $60AC           ; $04F9D2   |
    INC $0C8C           ; $04F9D5   |
    LDA #$0012          ; $04F9D8   |
    STA $60F8           ; $04F9DB   |
    STZ $61D2           ; $04F9DE   |
    LDA $0383           ; $04F9E1   |
    ASL A               ; $04F9E4   |
    STA $6116           ; $04F9E5   |
    JSL $04FB41         ; $04F9E8   |
    LDA #$2D6C          ; $04F9EC   |
    STA $3002           ; $04F9EF   |
    LDA #$2F6C          ; $04F9F2   |
    STA $3004           ; $04F9F5   |
    LDA #$0200          ; $04F9F8   |
    STA $3018           ; $04F9FB   |
    SEP #$10            ; $04F9FE   |
    LDX #$08            ; $04FA00   |
    LDA #$AA7F          ; $04FA02   |
    JSL $7EDE44         ; $04FA05   | GSU init
    REP #$10            ; $04FA09   |
    LDA #$0000          ; $04FA0B   |
    STA $70336C         ; $04FA0E   |
    LDX #$001C          ; $04FA12   |

CODE_04FA15:
    STA $7021A2,x       ; $04FA15   |
    STA $702F0E,x       ; $04FA19   |
    DEX                 ; $04FA1D   |
    DEX                 ; $04FA1E   |
    BPL CODE_04FA15     ; $04FA1F   |

CODE_04FA21:
    RTS                 ; $04FA21   |

CODE_04FA22:
    LDA $0C8E           ; $04FA22   |
    BNE CODE_04FA30     ; $04FA25   |
    STZ $60AC           ; $04FA27   |
    STZ $60C4           ; $04FA2A   |
    STZ $60F8           ; $04FA2D   |

CODE_04FA30:
    RTS                 ; $04FA30   |

DATA_04FA31:         db $32, $38

CODE_04FA33:
    LDA $0136           ; $04FA33   |
    CMP #$04            ; $04FA36   |
    BNE CODE_04FA4E     ; $04FA38   |
    LDX $0150           ; $04FA3A   |
    CPX #$03            ; $04FA3D   |
    BNE CODE_04FA4E     ; $04FA3F   |
    LDX #$01            ; $04FA41   |
    LDA $021A           ; $04FA43   |

CODE_04FA46:
    CMP $FA31,x         ; $04FA46   |
    BEQ CODE_04FA4E     ; $04FA49   |
    DEX                 ; $04FA4B   |
    BPL CODE_04FA46     ; $04FA4C   |

CODE_04FA4E:
    RTS                 ; $04FA4E   |

DATA_04FA4F:         dw $0000, $0000, $0001, $0001
DATA_04FA57:         dw $0002, $0002, $0004, $0004
DATA_04FA5F:         dw $0004, $0004, $0004, $0004

    REP #$30            ; $04FA67   |
    LDA $608A           ; $04FA69   |
    STA $7E10           ; $04FA6C   |
    LDA $608C           ; $04FA6F   |
    STA $7E12           ; $04FA72   |
    SEC                 ; $04FA75   |
    SBC $6094           ; $04FA76   |
    STA $60B0           ; $04FA79   |
    STA $3002           ; $04FA7C   |
    CLC                 ; $04FA7F   |
    ADC $0C80           ; $04FA80   |
    STA $6156           ; $04FA83   |
    LDA $608E           ; $04FA86   |
    STA $7E14           ; $04FA89   |
    LDA $6090           ; $04FA8C   |
    STA $7E16           ; $04FA8F   |
    SEC                 ; $04FA92   |
    SBC $609C           ; $04FA93   |
    STA $60B2           ; $04FA96   |
    STA $3004           ; $04FA99   |
    CLC                 ; $04FA9C   |
    ADC $0C82           ; $04FA9D   |
    STA $6158           ; $04FAA0   |
    LDA $611A           ; $04FAA3   |
    BEQ CODE_04FB16     ; $04FAA6   |
    LDA $61AE           ; $04FAA8   |
    ORA $0B55           ; $04FAAB   |
    ORA $614A           ; $04FAAE   |
    ORA $0398           ; $04FAB1   |
    BNE CODE_04FAE9     ; $04FAB4   |
    LDA $7E04           ; $04FAB6   |
    BNE CODE_04FAC0     ; $04FAB9   |
    LDA $61F4           ; $04FABB   |
    BEQ CODE_04FAD7     ; $04FABE   |

CODE_04FAC0:
    CMP #$00C0          ; $04FAC0   |
    BCS CODE_04FAD7     ; $04FAC3   |
    STA $00             ; $04FAC5   |
    LSR A               ; $04FAC7   |
    LSR A               ; $04FAC8   |
    LSR A               ; $04FAC9   |
    LSR A               ; $04FACA   |
    ASL A               ; $04FACB   |
    TAX                 ; $04FACC   |
    LDA $04FA4F,x       ; $04FACD   |
    AND $00             ; $04FAD1   |
    BEQ CODE_04FAE9     ; $04FAD3   |
    BRA CODE_04FB16     ; $04FAD5   |

CODE_04FAD7:
    LDA $61D6           ; $04FAD7   |
    LSR A               ; $04FADA   |
    LSR A               ; $04FADB   |
    LSR A               ; $04FADC   |
    LSR A               ; $04FADD   |
    ASL A               ; $04FADE   |
    TAX                 ; $04FADF   |
    LDA $7974           ; $04FAE0   |
    AND $04FA4F,x       ; $04FAE3   |
    BNE CODE_04FB16     ; $04FAE7   |

CODE_04FAE9:
    LDA $60C4           ; $04FAE9   |
    STA $3006           ; $04FAEC   |
    LDA $60BE           ; $04FAEF   | yoshi animation frame
    TAY                 ; $04FAF2   |
    ASL A               ; $04FAF3   |
    TAX                 ; $04FAF4   |
    LDA $4C0204,x       ; $04FAF5   | grab the starting OAM data
    CLC                 ; $04FAF9   |
    ADC #$060C          ; $04FAFA   |
    STA $301C           ; $04FAFD   |
    TYX                 ; $04FB00   |
    LDA $4C0000,x       ; $04FB01   | grab the size (# of OAM entries)
    AND #$00FF          ; $04FB05   |
    STA $3018           ; $04FB08   |
    SEP #$10            ; $04FB0B   |
    LDX #$09            ; $04FB0D   |
    LDA #$835F          ; $04FB0F   |
    JSL $7EDE44         ; $04FB12   | copy yoshi stuff to OAM buffer

CODE_04FB16:
    SEP #$30            ; $04FB16   |
    LDA #$03            ; $04FB18   |
    STA $611A           ; $04FB1A   |
    LDA #$0A            ; $04FB1D   |
    STA $6124           ; $04FB1F   |
    RTL                 ; $04FB22   |

DATA_04FB23:         dw $005C, $007A, $0098, $00B6
DATA_04FB2B:         dw $00D4, $00F2, $0110, $012E
DATA_04FB33:         dw $27AA, $27C8, $27E6, $2804
DATA_04FB3B:         dw $2822, $2840, $285E

    PHP                 ; $04FB41   |
    REP #$30            ; $04FB42   |
    PHA                 ; $04FB44   |
    PHX                 ; $04FB45   |
    PHY                 ; $04FB46   |
    PHB                 ; $04FB47   |
    LDX $6116           ; $04FB48   |
    PEA $7020           ; $04FB4B   |
    PLB                 ; $04FB4E   |
    PLB                 ; $04FB4F   |
    LDA $04FB23,x       ; $04FB50   |
    TAX                 ; $04FB54   |
    LDY #$001C          ; $04FB55   |

CODE_04FB58:
    LDA $5FA000,x       ; $04FB58   |
    STA $21A2,y         ; $04FB5C   |
    STA $2F0E,y         ; $04FB5F   |
    DEX                 ; $04FB62   |
    DEX                 ; $04FB63   |
    DEY                 ; $04FB64   |
    DEY                 ; $04FB65   |
    BPL CODE_04FB58     ; $04FB66   |
    PLB                 ; $04FB68   |
    PLY                 ; $04FB69   |
    PLX                 ; $04FB6A   |
    PLA                 ; $04FB6B   |
    PLP                 ; $04FB6C   |
    RTL                 ; $04FB6D   |

DATA_04FB6E:         dw $0040, $0080, $0100, $0080
DATA_04FB76:         dw $0080, $0080, $0080, $0080
DATA_04FB7E:         dw $0040, $00C0, $0080, $00C0
DATA_04FB86:         dw $0000, $0080, $0000, $0000
DATA_04FB8E:         dw $0080, $0080, $0080, $0080
DATA_04FB96:         dw $0040, $0100, $0100, $0100
DATA_04FB9E:         dw $0100, $0100, $0100, $0100
DATA_04FBA6:         dw $0100, $0100, $0100, $0100

DATA_04FBAE:         dw $0040, $FFFF, $FFFF, $0040
DATA_04FBB6:         dw $0040, $0040, $0040, $0040
DATA_04FBBE:         dw $FFFF, $0060, $0040, $FFFF
DATA_04FBC6:         dw $0000, $FFFF, $0000, $0000
DATA_04FBCE:         dw $0100, $0040, $0040, $0040
DATA_04FBD6:         dw $0040, $0100, $0100, $0100
DATA_04FBDE:         dw $0100, $0100, $0100, $0100
DATA_04FBE6:         dw $0100, $0100, $0100, $0100

DATA_04FBEE:         dw $0020, $0040, $0100, $0100
DATA_04FBF6:         dw $0000, $0040, $0133, $0080
DATA_04FBFE:         dw $0040, $0040, $0020, $0000
DATA_04FC06:         dw $0040, $0000, $0040, $0000
DATA_04FC0E:         dw $0040, $0040, $0080, $00C0
DATA_04FC16:         dw $0000, $0100, $0100, $0100
DATA_04FC1E:         dw $0100, $0100, $0100, $0100
DATA_04FC26:         dw $0100, $0100, $0100, $0100

DATA_04FC2E:         dw $0020, $FFFF, $FFFF, $FFFF
DATA_04FC36:         dw $0000, $0040, $0133, $0040
DATA_04FC3E:         dw $FFFF, $0020, $0020, $0000
DATA_04FC46:         dw $0020, $0000, $0040, $0000
DATA_04FC4E:         dw $0100, $0020, $0040, $0060
DATA_04FC56:         dw $0000, $0100, $0100, $0100
DATA_04FC5E:         dw $0100, $0100, $0100, $0100
DATA_04FC66:         dw $0100, $0100, $0100, $0100

DATA_04FC6E:         dw $0100, $0100, $0100, $0100
DATA_04FC76:         dw $0100, $0100, $0166, $0000
DATA_04FC7E:         dw $0100, $0100, $0100, $0000
DATA_04FC86:         dw $0000, $0100, $0000, $0000
DATA_04FC8E:         dw $0020, $0060, $0100, $0100
DATA_04FC96:         dw $0000, $0100, $0100, $0100
DATA_04FC9E:         dw $0100, $0100, $0100, $0100
DATA_04FCA6:         dw $0100, $0100, $0100, $0100

DATA_04FCAE:         dw $0100, $0100, $0100, $0100
DATA_04FCB6:         dw $0100, $0100, $0000, $0000
DATA_04FCBE:         dw $0100, $0100, $0100, $0000
DATA_04FCC6:         dw $0000, $0100, $0000, $0000
DATA_04FCCE:         dw $0100, $0020, $0100, $0100
DATA_04FCD6:         dw $0000, $0100, $0100, $0100
DATA_04FCDE:         dw $0100, $0100, $0100, $0100
DATA_04FCE6:         dw $0100, $0100, $0100, $0100

DATA_04FCEE:         dw $0023, $0600, $0406, $0206
DATA_04FCF6:         dw $0106, $0606, $0102, $0104
DATA_04FCFE:         dw $0001, $0000, $0000, $0000
DATA_04FD06:         dw $0100, $0000, $FF00, $0100
DATA_04FD0E:         dw $00FF, $0000, $0000, $0000
DATA_04FD16:         dw $0100, $0000, $0100, $FF00
DATA_04FD1E:         dw $00FF, $FFF8, $0008, $FFF8
DATA_04FD26:         dw $0008

.update_camera
    PHB                 ; $04FD28   |
    PHK                 ; $04FD29   |
    PLB                 ; $04FD2A   |
    REP #$20            ; $04FD2B   |
    LDA $0D0F           ; $04FD2D   | make sure no message box active
    BEQ CODE_04FD35     ; $04FD30   |
    JMP CODE_04FDC1     ; $04FD32   |

CODE_04FD35:
    LDA $7E2A           ; $04FD35   |
    ORA $0B57           ; $04FD38   |
    BNE CODE_04FD55     ; $04FD3B   |
    LDA $61AE           ; $04FD3D   |
    ORA $0C8E           ; $04FD40   |
    ORA $0B55           ; $04FD43   |
    ORA $0398           ; $04FD46   |
    BNE CODE_04FDC1     ; $04FD49   |
    LDA $614E           ; $04FD4B   |
    BEQ CODE_04FD55     ; $04FD4E   |
    CMP #$0005          ; $04FD50   |
    BCS CODE_04FDC1     ; $04FD53   |

CODE_04FD55:
    REP #$10            ; $04FD55   |
    LDA $0C1C           ; $04FD57   | tests autoscrolling active
    TAY                 ; $04FD5A   |
    BEQ CODE_04FD67     ; $04FD5B   |
    JSL $03D6A0         ; $04FD5D   | compute autoscrolling for camera
    LDA $0C2A           ; $04FD61   |
    LDY $0C22           ; $04FD64   |

CODE_04FD67:
    STA $7E28           ; $04FD67   |
    STY $7E26           ; $04FD6A   |
    SEP #$10            ; $04FD6D   |
    LDX $60AC           ; $04FD6F   |
    CPX #$16            ; $04FD72   |
    BEQ CODE_04FDC1     ; $04FD74   |
    LDX $014C           ; $04FD76   |
    CPX #$0D            ; $04FD79   |
    BNE CODE_04FDAE     ; $04FD7B   |
    LDX $60AC           ; $04FD7D   |
    CPX #$08            ; $04FD80   |
    BNE CODE_04FDA2     ; $04FD82   |
    LDY $6106           ; $04FD84   |
    LDA $E686           ; $04FD87   |
    STA $7E22           ; $04FD8A   |
    LDA $6090           ; $04FD8D   |
    SEC                 ; $04FD90   |
    SBC $609C           ; $04FD91   |
    SEC                 ; $04FD94   |
    SBC $7E22           ; $04FD95   |
    EOR $E68A,y         ; $04FD98   |
    BMI CODE_04FDA2     ; $04FD9B   |
    LDA #$0000          ; $04FD9D   |
    BRA CODE_04FDAB     ; $04FDA0   |

CODE_04FDA2:
    LDA $609C           ; $04FDA2   |
    STA $0C27           ; $04FDA5   |
    LDA #$0001          ; $04FDA8   |

CODE_04FDAB:
    STA $0C20           ; $04FDAB   |

CODE_04FDAE:
    LDX #$09            ; $04FDAE   |
    LDA #$94D7          ; $04FDB0   |
    JSL $7EDE44         ; $04FDB3   | update camera GSU routine
    LDA $609C           ; $04FDB7   |
    CLC                 ; $04FDBA   |
    ADC #$000C          ; $04FDBB   |
    STA $609C           ; $04FDBE   |

CODE_04FDC1:
    LDA $6094           ; $04FDC1   |
    LDY $0C1E           ; $04FDC4   | \
    BEQ CODE_04FDD8     ; $04FDC7   |  | autoscroll
    LDA $0C22           ; $04FDC9   |  | put highest X byte (screen) into $7E0C
    AND #$00FF          ; $04FDCC   |  |
    STA $7E0C           ; $04FDCF   |  | and the rest into camera X, $6094
    LDA $0C23           ; $04FDD2   |  |
    STA $6094           ; $04FDD5   | /

CODE_04FDD8:
    LDY #$00            ; $04FDD8   |
    CMP $39             ; $04FDDA   |
    BPL CODE_04FDE0     ; $04FDDC   |
    LDY #$02            ; $04FDDE   |

CODE_04FDE0:
    STY $73             ; $04FDE0   |
    STA $39             ; $04FDE2   |
    LDA $609C           ; $04FDE4   |
    LDY $0C20           ; $04FDE7   | \
    BEQ CODE_04FDFB     ; $04FDEA   |  | autoscroll
    LDA $0C26           ; $04FDEC   |  | put highest Y byte (screen) into $7E0E
    AND #$00FF          ; $04FDEF   |  |
    STA $7E0E           ; $04FDF2   |  | and the rest into camera Y, $609C
    LDA $0C27           ; $04FDF5   |  |
    STA $609C           ; $04FDF8   | /

CODE_04FDFB:
    LDY #$00            ; $04FDFB   |
    CMP $3B             ; $04FDFD   |
    BPL CODE_04FE03     ; $04FDFF   |
    LDY #$02            ; $04FE01   |

CODE_04FE03:
    STY $75             ; $04FE03   |
    STA $3B             ; $04FE05   |
    STA $3B             ; $04FE07   |
    LDY $0134           ; $04FE09   |
    CPY #$10            ; $04FE0C   |
    BCC CODE_04FE23     ; $04FE0E   |
    LSR A               ; $04FE10   |
    LSR A               ; $04FE11   |
    LSR A               ; $04FE12   |
    PHA                 ; $04FE13   |
    CLC                 ; $04FE14   |
    ADC #$56DE          ; $04FE15   |
    STA $0D0B           ; $04FE18   |
    PLA                 ; $04FE1B   |
    ASL A               ; $04FE1C   |
    ADC #$5894          ; $04FE1D   |
    STA $0D09           ; $04FE20   |

CODE_04FE23:
    LDA $0D0D           ; $04FE23   |
    BEQ CODE_04FE43     ; $04FE26   |
    LDA $43             ; $04FE28   |
    SEC                 ; $04FE2A   |
    SBC #$0029          ; $04FE2B   |
    BPL CODE_04FE33     ; $04FE2E   |
    LDA #$0000          ; $04FE30   |

CODE_04FE33:
    PHA                 ; $04FE33   |
    CLC                 ; $04FE34   |
    ADC #$56DE          ; $04FE35   |
    STA $0D0B           ; $04FE38   |
    PLA                 ; $04FE3B   |
    ASL A               ; $04FE3C   |
    ADC #$5894          ; $04FE3D   |
    STA $0D09           ; $04FE40   |

CODE_04FE43:
    LDA $014C           ; $04FE43   |
    ASL A               ; $04FE46   |
    TAX                 ; $04FE47   |
    LDA $FB6E,x         ; $04FE48   |
    STA $3010           ; $04FE4B   |
    LDA $FBAE,x         ; $04FE4E   |
    STA $3012           ; $04FE51   |
    LDA $FBEE,x         ; $04FE54   |
    LDY $0136           ; $04FE57   |
    CPY #$03            ; $04FE5A   |
    BNE CODE_04FE61     ; $04FE5C   |
    LDA #$0000          ; $04FE5E   |

CODE_04FE61:
    STA $3014           ; $04FE61   |
    LDA $FC2E,x         ; $04FE64   |
    LDY $013E           ; $04FE67   |
    CPY #$1C            ; $04FE6A   |
    BNE CODE_04FE74     ; $04FE6C   |
    JSR CODE_04FF06     ; $04FE6E   |
    LDA #$0000          ; $04FE71   |

CODE_04FE74:
    STA $3016           ; $04FE74   |
    LDA $FC6E,x         ; $04FE77   |
    STA $3018           ; $04FE7A   |
    LDA $FCAE,x         ; $04FE7D   |
    STA $301A           ; $04FE80   |
    LDX #$09            ; $04FE83   |
    LDA #$93B3          ; $04FE85   |
    JSL $7EDE44         ; $04FE88   | compute camera layers
    LDA $6096           ; $04FE8C   |
    STA $3D             ; $04FE8F   |
    LDA $609E           ; $04FE91   |
    STA $3F             ; $04FE94   |
    LDY $013E           ; $04FE96   |
    CPY #$1A            ; $04FE99   |
    BNE CODE_04FEC1     ; $04FE9B   |
    LDA $7974           ; $04FE9D   |
    LSR A               ; $04FEA0   |
    LSR A               ; $04FEA1   |
    PHA                 ; $04FEA2   |
    CLC                 ; $04FEA3   |
    ADC $6098           ; $04FEA4   |
    CLC                 ; $04FEA7   |
    ADC $0C90           ; $04FEA8   |
    STA $6098           ; $04FEAB   |
    STA $41             ; $04FEAE   |
    PLA                 ; $04FEB0   |
    LSR A               ; $04FEB1   |
    CLC                 ; $04FEB2   |
    ADC $60A0           ; $04FEB3   |
    CLC                 ; $04FEB6   |
    ADC $0C92           ; $04FEB7   |
    STA $60A0           ; $04FEBA   |
    STA $43             ; $04FEBD   |
    BRA CODE_04FEF8     ; $04FEBF   |

CODE_04FEC1:
    CPY #$2D            ; $04FEC1   |
    BNE CODE_04FED7     ; $04FEC3   |
    LDA $7974           ; $04FEC5   |
    LSR A               ; $04FEC8   |
    LSR A               ; $04FEC9   |
    LSR A               ; $04FECA   |
    ADC $6094           ; $04FECB   |
    STA $6098           ; $04FECE   |
    LDA $609C           ; $04FED1   |
    STA $60A0           ; $04FED4   |

CODE_04FED7:
    DEY                 ; $04FED7   |
    BNE CODE_04FEEE     ; $04FED8   |
    LDA $7974           ; $04FEDA   |
    LSR A               ; $04FEDD   |
    LSR A               ; $04FEDE   |
    CLC                 ; $04FEDF   |
    ADC $6098           ; $04FEE0   |
    CLC                 ; $04FEE3   |
    ADC $0C90           ; $04FEE4   |
    STA $6098           ; $04FEE7   |
    STA $41             ; $04FEEA   |
    BRA CODE_04FEF8     ; $04FEEC   |

CODE_04FEEE:
    LDA $6098           ; $04FEEE   |
    STA $41             ; $04FEF1   |
    LDA $60A0           ; $04FEF3   |
    STA $43             ; $04FEF6   |

CODE_04FEF8:
    LDA $609A           ; $04FEF8   |
    STA $45             ; $04FEFB   |
    LDA $60A2           ; $04FEFD   |
    STA $47             ; $04FF00   |
    SEP #$30            ; $04FF02   |
    PLB                 ; $04FF04   |
    RTL                 ; $04FF05   |

CODE_04FF06:
    LDA #$00F8          ; $04FF06   |
    SEC                 ; $04FF09   |
    SBC $60B0           ; $04FF0A   |
    STA $6098           ; $04FF0D   |
    LDA #$00F0          ; $04FF10   |
    SEC                 ; $04FF13   |
    SBC $60B2           ; $04FF14   |
    STA $60A0           ; $04FF17   |
    RTS                 ; $04FF1A   |

; freespace
DATA_04FF1B:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_04FF23:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_04FF2B:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_04FF33:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_04FF3B:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_04FF43:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_04FF4B:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_04FF53:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_04FF5B:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_04FF63:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_04FF6B:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_04FF73:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_04FF7B:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_04FF83:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_04FF8B:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_04FF93:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_04FF9B:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_04FFA3:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_04FFAB:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_04FFB3:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_04FFBB:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_04FFC3:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_04FFCB:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_04FFD3:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_04FFDB:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_04FFE3:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_04FFEB:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_04FFF3:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_04FFFB:         db $FF, $FF, $FF, $FF, $FF
