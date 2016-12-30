.def temp=R17 ;����������� ������������� ��� ��������
.def D=R20	// ������� ��� �������
.def TIMER=R21	// ������� - ����, ����� ��� �� ���������� ����� �������� ������

// ������ ����� ����� � � ������������ � �������
.equ LED_B_R = 0b00000001	//�������
.equ LED_B_Y = 0b00000010	//������
.equ LED_B_G = 0b00000100	//�������
.equ LED_S_G = 0b00001000	//������� ��� ���������
.equ LED_S_R = 0b00010000	//������� ��� ���������

// ������
// ������ ���������� ��������� �������� � ��������, ������ �������� ������� ���� �������� �� ���� �
.macro show
	ldi temp, @1	//	��������� �� ���� � ��, ��� ���� �� ������ ��������� �������
	out PORTC, temp
	ldi D, (16*@0)-1	//	�������� ������ �������� ������� (�������� � ��������) �� ��������� ������� ��������� ���������
	rcall delay_loop//	�������� �������� �������
.endm

.dseg
.cseg

// ����������� ������ ����������
.org 0	// ���������� ������, ��� � �������
	rjmp Init

.org OVF0addr	//����������, ���������� ������������� �������� �������
	rjmp OnTimer0_Overflow

.org INT_VECTORS_SIZE	

// �������������
Init:
	ldi temp, 0xff ; ����������� ���� C �� �����
	out DDRC, temp

	ldi r16, (1<<CS02)	// ������������� �������� ������� ������� 256
	out TCCR0, r16
	
	ldi r16, 1<<TOV0	// ��� � �����, ��� �������� ������� ������. � ����� � ��� ������� �����
	out TIFR, r16

	ldi r16, 1<<TOIE0	// �������� ���������� �������� ������� �� ������������
	out TIMSK, r16
	sei	// ��������� ��� ����������

// �������� �����
program:
	show 16, LED_B_R | LED_S_G	// �������� ������� ��� ����� � ������� ��� ���������
	show 2, LED_B_R	// ������ �������
	show 2, LED_B_R | LED_S_G // ����� ������� � �������, ������
	show 2, LED_B_R
	show 2, LED_B_R | LED_S_G
	show 2, LED_B_R
	show 2, LED_B_R | LED_S_G

	show 2, LED_B_Y | LED_S_R
	// ����� �� ������ � �������
	// ������������ �������� 16��� !!!

	rjmp program

OnTimer0_Overflow:	// ��� �������
	ldi TIMER, 0xff	// ������������� ���� �������
	reti	//������� �� ����������
 
 // ���� ������ ������� ���, ������� �������� � D
delay_loop:
	cpi TIMER, 0xff
	brne delay_loop
	ldi TIMER, 0x00
	dec D
	brne delay_loop
	ret