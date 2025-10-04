/* This will force us to create a kernel entry function instead of jumping to kernel.c:0x00 */
void dummy_test_entrypoint() {
}

#define VIDEO_MEMORY 0xb8000

void printStr(char *text, char color){
    char *_Vmem = (char *) VIDEO_MEMORY;
    for(int i=0; i!='\0'; i++){
        *_Vmem++ = text[i];
	*_Vmem++ = color;
    }
}

int main() {
    char* video_memory = (char*) VIDEO_MEMORY;
    *video_memory = 'X';
    *(video_memory++) = 7;
    *video_memory++ = 'Y';
    *(video_memory++) = 7;

    printStr("Fig-OS", 'O');

    return 0;
}
