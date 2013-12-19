//
//  LoginViewController.m
//  Rogotest
//
//  Created by rost on 06.09.13.
//  Copyright (c) 2013 rost. All rights reserved.
//

#import "LoginViewController.h"
#import "DSActivityView.h"

@interface LoginViewController ()
@property (nonatomic, assign) DSActivityView *actIndicView;
@end

@implementation LoginViewController

@synthesize actIndicView;


#pragma mark - Constructor
- (id)init
{
    self = [super init];
    if (self)
    {
        // Custom initialization
    }
    return self;
}
#pragma mark -


#pragma mark - Destructor
- (void) dealloc
{
    self.actIndicView = nil;
    
    [super dealloc];
}
#pragma mark -


#pragma mark - View life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
	self.view.backgroundColor = [UIColor colorWithRed:252.0f/255.0f green:252.0f/255.0f blue:232.0f/255.0f alpha:1.0f];
        
    
    float emailYIndent = 160.0f;
    float yIndent      = 20.0f;
    float height       = 20.0F;
    float pwdYIndent   = emailYIndent + height + yIndent;
    float nameYIndent  = pwdYIndent + height + yIndent;
    float familYIndent = nameYIndent + height + yIndent;
    
    [self addRoundedLabelFromRect:CGRectMake(5.0f, 100.0f, self.view.bounds.size.width - 10.0f, 5 * (38.0f + height))];
    
    [self addLabelFromRect:CGRectMake((self.view.bounds.size.width / 2) - 90.0f, emailYIndent - 40.0f, 180.0f, height)
                 withTitle:@"Введите Ваши данные"];
    
    [self addLabelFromRect:CGRectMake(10.0f, emailYIndent, 50.0f, height) withTitle:@"Е-мейл"];
    
    [self addLabelFromRect:CGRectMake(10.0f, emailYIndent, 50.0f, height) withTitle:@"Е-мейл"];
    
    [self addLabelFromRect:CGRectMake(10.0f, pwdYIndent, 50.0f, height) withTitle:@"Пароль"];

    [self addLabelFromRect:CGRectMake(10.0f, nameYIndent, 50.0f, height) withTitle:@"Имя"];

    [self addLabelFromRect:CGRectMake(10.0f, familYIndent, 70.0f, height) withTitle:@"Фамилия"];
    
    [self addTextFieldWithRect:CGRectMake(80.0f, emailYIndent, self.view.bounds.size.width - 90.0f, height + 5.0f)
                       withTag:EMAIL_TXTFLD_TAG
                    withHolder:@"Ваш е-мейл"
                     withAlign:TEXT_ALIGN_LEFT_TAG
                    withRetBtn:NEXT_RETURN_KEY];
    
    [self addTextFieldWithRect:CGRectMake(80.0f, pwdYIndent, self.view.bounds.size.width - 90.0f, height + 5.0f)
                       withTag:PWD_TXTFLD_TAG
                    withHolder:@"Ваш пароль"
                     withAlign:TEXT_ALIGN_LEFT_TAG
                    withRetBtn:NEXT_RETURN_KEY];
    
    [self addTextFieldWithRect:CGRectMake(80.0f, nameYIndent, self.view.bounds.size.width - 90.0f, height + 5.0f)
                       withTag:NAME_TXTFLD_TAG
                    withHolder:@"Ваше имя"
                     withAlign:TEXT_ALIGN_LEFT_TAG
                    withRetBtn:NEXT_RETURN_KEY];
    
    [self addTextFieldWithRect:CGRectMake(80.0f, familYIndent, self.view.bounds.size.width - 90.0f, height + 5.0f)
                       withTag:FAMIL_TXTFLD_TAG
                    withHolder:@"Ваша фамилия"
                     withAlign:TEXT_ALIGN_LEFT_TAG
                    withRetBtn:DONE_RETURN_KEY];
    
    [self addButtonFromRect:CGRectMake(20.0f, familYIndent + (height * 2.8f), self.view.bounds.size.width - 40.0f, height * 2.0f)
                  withTitle:@"Регистрация"
                withBGImage:@"login_btn"
                 withRaduis:10];
}
#pragma mark -


#pragma mark - UI Factory methods
#pragma mark - addLabelFromRect:withTitle:
- (void)addLabelFromRect:(CGRect)lblRect withTitle:(NSString *)titleStr
{
    UILabel *setLbl = [[[UILabel alloc] initWithFrame:lblRect] autorelease];
    [setLbl setNumberOfLines:1];
    
    setLbl.backgroundColor  = [UIColor clearColor];    
    setLbl.textColor        = [UIColor blackColor];
    
    if (![EMPTY_STRING:titleStr])
    {
        setLbl.text = titleStr;
    }
    
    if ([titleStr isEqualToString:@"Введите Ваши данные"])
    {
        setLbl.font = [UIFont fontWithName:@"Helvetica-Bold" size:16.0f];
    }
    else
        {
            setLbl.font = [UIFont fontWithName:@"Helvetica" size:14.0f];
        }
    
    [self.view addSubview:setLbl];
}
#pragma mark -

#pragma mark - addRoundedLabelFromRect:
- (void)addRoundedLabelFromRect:(CGRect)lblRect
{
    UILabel *addLbl = [[[UILabel alloc] initWithFrame:lblRect] autorelease];
    
    addLbl.backgroundColor  = [UIColor colorWithRed:247.0f/255.0f green:247.0f/255.0f blue:237.0f/255.0f alpha:1.0f];
    
    addLbl.layer.borderWidth    = 0.5f;
    addLbl.layer.borderColor    = [UIColor lightGrayColor].CGColor;
    addLbl.layer.cornerRadius   = 8;
    addLbl.clipsToBounds        = YES;
    
    [self.view addSubview:addLbl];
}
#pragma mark -

#pragma mark - addTextFieldWithRect:withTag:withAlign:withRetBtn:
- (void) addTextFieldWithRect:(CGRect)frameRect
                      withTag:(NSUInteger)tagInt
                   withHolder:(NSString *)holderStr
                    withAlign:(NSUInteger)alignTag
                   withRetBtn:(NSUInteger)retBtnTag
{
    UITextField *txtFld             = [[UITextField alloc] initWithFrame:frameRect];
    txtFld.tag                      = tagInt;
    txtFld.placeholder              = holderStr;
    txtFld.textColor                = [UIColor blackColor];
    [txtFld setFont:[UIFont fontWithName:@"Helvetica" size:14.0f]];
    txtFld.backgroundColor          = [UIColor whiteColor];
    
    if (retBtnTag == NEXT_RETURN_KEY)
    {
        txtFld.returnKeyType        = UIReturnKeyNext;
    }
    else
        if  (retBtnTag == DONE_RETURN_KEY)
        {
            txtFld.returnKeyType    = UIReturnKeyDone;
        }
    
    if (tagInt == PWD_TXTFLD_TAG)
    {
        txtFld.secureTextEntry = YES;
    }
    
    txtFld.textAlignment            = [[Helper shared] getTextAlignByiOSVersFromTag:alignTag];
    txtFld.clearButtonMode          = UITextFieldViewModeWhileEditing;
    txtFld.borderStyle              = UITextBorderStyleRoundedRect;
    txtFld.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtFld.text                     = @"";
    txtFld.keyboardType             = UIKeyboardTypeEmailAddress;
    txtFld.delegate                 = self;
    
    [self.view addSubview:txtFld];    
    SMART_RELEASE(txtFld);
}
#pragma mark -

#pragma mark - addButtonFromRect:withTitle:withBGImage:withRaduis:
- (void) addButtonFromRect:(CGRect)btnRect
                 withTitle:(NSString *)titleStr
               withBGImage:(NSString *)bgStr
                withRaduis:(NSUInteger)radius
{
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addBtn setFrame:btnRect];
    
    if (![EMPTY_STRING:bgStr])
    {
        [addBtn setBackgroundImage:[UIImage imageNamed:bgStr] forState:UIControlStateNormal];
        [addBtn setBackgroundImage:[UIImage imageNamed:[FORMAT_STRING:@"%@_tapped", bgStr]]
                          forState:UIControlStateHighlighted];
    }
    
    if (![EMPTY_STRING:titleStr])
    {
        [addBtn setTitle:titleStr forState:UIControlStateNormal];
        [addBtn setTitle:titleStr forState:UIControlStateHighlighted];
        addBtn.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16.0f];
        
        [addBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [addBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    }

    addBtn.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    
    [addBtn addTarget:self action:@selector(btnSelector) forControlEvents:UIControlEventTouchUpInside];
    
    if (radius > 0)
    {
        addBtn.layer.borderWidth    = 1.5f;
        addBtn.layer.borderColor    = [UIColor lightGrayColor].CGColor;
        addBtn.layer.cornerRadius   = radius;
        addBtn.clipsToBounds        = YES;
    }
    [self.view addSubview:addBtn];
}
#pragma mark -
#pragma mark -


#pragma mark - btnSelector
- (void) btnSelector
{
    UITextField *fnameTxtFld = (UITextField *)[self.view viewWithTag:NAME_TXTFLD_TAG];
    UITextField *lnameTxtFld = (UITextField *)[self.view viewWithTag:FAMIL_TXTFLD_TAG];
    UITextField *emailTxtFld = (UITextField *)[self.view viewWithTag:EMAIL_TXTFLD_TAG];
    UITextField *pwdTxtFld   = (UITextField *)[self.view viewWithTag:PWD_TXTFLD_TAG];
    
    if (([self checkTxtField:fnameTxtFld]) && ([self checkTxtField:lnameTxtFld]) &&
        ([self checkTxtField:emailTxtFld]) && ([self checkTxtField:pwdTxtFld]))
        {
            [fnameTxtFld resignFirstResponder];
            [lnameTxtFld resignFirstResponder];
            [emailTxtFld resignFirstResponder];
            [pwdTxtFld resignFirstResponder];
            
            [self movingViewByFlag:FALSE];
            
            if ((![EMPTY_STRING:fnameTxtFld.text]) && (![EMPTY_STRING:lnameTxtFld.text]) &&
                (![EMPTY_STRING:emailTxtFld.text]) && (![EMPTY_STRING:pwdTxtFld.text]))
                {
                    ServerConnector *servConn = [[ServerConnector alloc] init];
                    
                    if ([servConn isOnline])
                    {
                        [self showActivityIndicator];
                            
                        servConn.connectorDelegate  = self;

                        [servConn sendStartUserInfo:[NSDictionary dictionaryWithObjectsAndKeys:
                                                            [[Helper shared] encodeString:fnameTxtFld.text],       @"first_name",
                                                            [[Helper shared] encodeString:lnameTxtFld.text],       @"last_name",
                                                            emailTxtFld.text,                                      @"email",
                                                            pwdTxtFld.text,                                        @"password", nil]];
                    }
                    else
                        {
                            [self showPopup:@"Подключение в Интернету недоступно \n Проверьте настройки Вашего устройства" withTitle:@"Ошибка"];
                        }
                    SMART_RELEASE(servConn);
                }
                else
                    {
                        [self showPopup:@"Пожалуйста заполните все поля" withTitle:@"Ошибка"];
                    }
        }
}
#pragma mark -


#pragma mark - ServerConnector delegate methods
- (void) parseFinishWithObject:(id)resObj
{
    [self hideActivityIndicator];
    [self showPopup:[FORMAT_STRING:@"%@",(NSString *)resObj] withTitle:@"Сообщение"];
}

- (void) backWithError:(NSString *)errStr
{
    [self hideActivityIndicator];
    [self showPopup:[FORMAT_STRING:@"\n %@",errStr] withTitle:@"Ошибка"];
}
#pragma mark -

#pragma mark - UITextField delegate methods
#pragma mark - textFieldEndEditing:
- (BOOL)textFieldEndEditing:(UITextField *)textField
{
	[textField resignFirstResponder];
	return NO;
}
#pragma mark -

#pragma mark - textFieldShouldBeginEditing:
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [self movingViewByFlag:TRUE];

    return YES;
}
#pragma mark -

#pragma mark - textFieldShouldReturn:
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self checkTxtField:textField];
    
	return NO;
}
#pragma mark -


- (BOOL) checkTxtField:(UITextField *)textField
{
    BOOL resflag = FALSE;
    
    switch (textField.tag)
    {
        case EMAIL_TXTFLD_TAG:
        {
            if ([[Checker shared] checkTitle:textField.text])
            {
                [[self.view viewWithTag:PWD_TXTFLD_TAG] becomeFirstResponder];
                
                resflag = TRUE;
            }
            else
                {
                    [self showPopup:@"Введите корректный Е-мейл" withTitle:@"Ошибка"];
                }
        }
            break;
            
            
        case PWD_TXTFLD_TAG:
        {
            if ((textField.text.length >= 6) && (textField.text.length <= 12))
            {
                if ([[Checker shared] checkPasswd:textField.text])
                {
                    [[self.view viewWithTag:NAME_TXTFLD_TAG] becomeFirstResponder];
                    
                    resflag = TRUE;
                }
                else
                    {
                        [self showPopup:@"Введите корректный пароль" withTitle:@"Ошибка"];
                    }
            }
            else
                {
                    [self showPopup:@"Пароль должен быть более 6 символов и менее 12" withTitle:@"Ошибка"];
                }
        }
            break;
            
            
        case NAME_TXTFLD_TAG:
        {
            if ((textField.text.length >= 2) && (textField.text.length <= 15))
            {
                if ([[Checker shared] checkName:textField.text])
                {
                    [[self.view viewWithTag:FAMIL_TXTFLD_TAG] becomeFirstResponder];
                    
                    resflag = TRUE;
                }
                else
                    {
                        [self showPopup:@"Введите корректное имя" withTitle:@"Ошибка"];
                    }
            }
            else
                {
                    [self showPopup:@"Имя должно состоять из более 2 символов" withTitle:@"Ошибка"];
                }
        }
            break;
            
            
        case FAMIL_TXTFLD_TAG:
        {
            if ((textField.text.length >= 2) && (textField.text.length <= 15))
            {
                if ([[Checker shared] checkSurName:textField.text])
                {
                    [self movingViewByFlag:FALSE];
                    
                    [[self.view viewWithTag:FAMIL_TXTFLD_TAG] resignFirstResponder];
                    
                    resflag = TRUE;
                }
                else
                    {
                        [self showPopup:@"Напишите фамилию корректно" withTitle:@"Ошибка"];
                    }
            }
            else
                {
                    [self showPopup:@"Фамилия должна состоять из более 2 символов" withTitle:@"Ошибка"];
                }
            
        }
            break;
    }
    
    return resflag;
}


#pragma mark - movingViewByFlag:
- (void) movingViewByFlag:(BOOL)upFlag
{
    CGRect frame    = self.view.frame;
    
    float yIndent   = 0.0f;
    float yOffset   = 60.0f;
    

    if ([[[UIDevice currentDevice] systemVersion] floatValue] > 5.1)
    {
        yOffset   = yOffset + 25.0f;
    }
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] > 6.1)
    {
        yOffset   = yOffset + 35.0f;
    }
    
    
    if (upFlag == FALSE)
    {
        if (frame.origin.y < 0.0f)
        {
            yIndent = frame.origin.y + yOffset;
            frame.origin.y   = yIndent;
        }
    }
    else
        {
            if ((frame.origin.y == 0.0f) || (frame.origin.y == 20.0f))
            {
                
                yIndent = frame.origin.y - yOffset;
                frame.origin.y   = yIndent;
            }
        }
    
    NSTimeInterval animationDuration = 0.300000011920929;
    
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    self.view.frame = frame;
    [UIView commitAnimations];
}
#pragma mark -


#pragma mark - showPopup:withTitle:
- (void) showPopup:(NSString *)msgStr withTitle:(NSString *)titleStr
{
    UIAlertView *popupView = [[UIAlertView alloc] initWithTitle:titleStr
                                                        message:msgStr
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    [popupView show];
    SMART_RELEASE(popupView);
}
#pragma mark -


#pragma mark - Activity indicator lib methods
- (void) showActivityIndicatorWithTitle:(NSString *)title
                             fullscreen:(BOOL )fullscreen
{
	UIView* view = ((self.navigationController != nil) && fullscreen) ? self.navigationController.view : self.view;
	
	actIndicView = [DSBezelActivityView newActivityViewForView: view withLabel: title];
}

- (void) showActivityIndicatorWithTitle: (NSString*) title
{
	[self showActivityIndicatorWithTitle: title fullscreen: YES];
}

- (void) showActivityIndicator
{
	[self showActivityIndicatorWithTitle: nil];
}

- (void) changeActivityIndicatorTitleTo: (NSString*) title
{
	[DSActivityView currentActivityView].activityLabel.text = title;
}

- (void) hideActivityIndicator
{
	[DSBezelActivityView removeViewAnimated: YES];
}
#pragma mark -


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
