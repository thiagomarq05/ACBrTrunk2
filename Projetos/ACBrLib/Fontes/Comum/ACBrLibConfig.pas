{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para interação com equipa- }
{ mentos de Automação Comercial utilizados no Brasil                           }

{ Direitos Autorais Reservados (c) 2018 Daniel Simoes de Almeida               }

{ Colaboradores nesse arquivo: Rafael Teno Dias                                }

{  Você pode obter a última versão desse arquivo na pagina do  Projeto ACBr    }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }

{  Esta biblioteca é software livre; você pode redistribuí-la e/ou modificá-la }
{ sob os termos da Licença Pública Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a versão 2.1 da Licença, ou (a seu critério) }
{ qualquer versão posterior.                                                   }

{  Esta biblioteca é distribuída na expectativa de que seja útil, porém, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia implícita de COMERCIABILIDADE OU      }
{ ADEQUAÇÃO A UMA FINALIDADE ESPECÍFICA. Consulte a Licença Pública Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICENÇA.TXT ou LICENSE.TXT)              }

{  Você deve ter recebido uma cópia da Licença Pública Geral Menor do GNU junto}
{ com esta biblioteca; se não, escreva para a Free Software Foundation, Inc.,  }
{ no endereço 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Você também pode obter uma copia da licença em:                              }
{ http://www.opensource.org/licenses/gpl-license.php                           }

{ Daniel Simões de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{        Rua Cel.Aureliano de Camargo, 973 - Tatuí - SP - 18270-170            }

{******************************************************************************}

{$I ACBr.inc}

unit ACBrLibConfig;

interface

uses
  Classes, SysUtils, IniFiles,
  synachar, mimemess,
  ACBrLibResposta;

type
  //               0           1          2           3             4
  TNivelLog = (logNenhum, logSimples, logNormal, logCompleto, logParanoico);

  //                         0          1
  TTipoRelatorioBobina = (tpFortes, tpEscPos);

  { TLogConfig }

  TLogConfig = class
  private
    FNivel: TNivelLog;
    FPath: String;
    procedure SetPath(AValue: String);
  public
    constructor Create;
    procedure DefinirValoresPadroes;
    procedure LerIni(const AIni: TCustomIniFile);
    procedure GravarIni(const AIni: TCustomIniFile);

    property Nivel: TNivelLog read FNivel;
    property Path: String read FPath;
  end;

  { TSistemaConfig }

  TSistemaConfig = class
  private
    FData: TDateTime;
    FDescricao: String;
    FNome: String;
    FVersao: String;
  public
    constructor Create;
    procedure DefinirValoresPadroes;
    procedure LerIni(const AIni: TCustomIniFile);
    procedure GravarIni(const AIni: TCustomIniFile);

    property Nome: String read FNome;
    property Versao: String read FVersao;
    property Data: TDateTime read FData;
    property Descricao: String read FDescricao;
  end;

  { TProxyConfig }

  TProxyConfig = class
  private
    FPorta: Integer;
    FSenha: String;
    FServidor: String;
    FUsuario: String;
    FChaveCrypt: AnsiString;

    function GetSenha: String;
  public
    constructor Create(AChaveCrypt: AnsiString = ''); virtual;

    procedure DefinirValoresPadroes;
    procedure LerIni(const AIni: TCustomIniFile);
    procedure GravarIni(const AIni: TCustomIniFile);

    property Servidor: String read FServidor;
    property Porta: Integer read FPorta;
    property Usuario: String read FUsuario;
    property Senha: String read GetSenha;
  end;

  { TEmailConfig }

  TEmailConfig = class
  private
    FCodificacao: TMimeChar;
    FConfirmacao: Boolean;
    FConfirmacaoEntrega: Boolean;
    FConta: String;
    FIsHTML: Boolean;
    FNome: String;
    FPorta: Integer;
    FPriority: TMessPriority;
    FSegundoPlano: Boolean;
    FSenha: String;
    FServidor: String;
    FSSL: Boolean;
    FTentativas: Integer;
    FTimeOut: Integer;
    FTLS: Boolean;
    FUsuario: String;
    FChaveCrypt: AnsiString;

    function GetSenha: String;
  public
    constructor Create(AChaveCrypt: AnsiString = ''); virtual;

    procedure DefinirValoresPadroes;
    procedure LerIni(const AIni: TCustomIniFile);
    procedure GravarIni(const AIni: TCustomIniFile);

    property Nome: String read FNome;
    property Servidor: String read FServidor;
    property Conta: String read FConta;
    property Usuario: String read FUsuario;
    property Senha: String read GetSenha;
    property Codificacao: TMimeChar read FCodificacao;
    property Porta: Integer read FPorta;
    property SSL: Boolean read FSSL;
    property TLS: Boolean read FTLS;
    property Confirmacao: Boolean read FConfirmacao;
    property ConfirmacaoEntrega: Boolean read FConfirmacaoEntrega;
    property SegundoPlano: Boolean read FSegundoPlano;
    property TimeOut: Integer read FTimeOut;
    property Tentativas: Integer read FTentativas;
    property IsHTML: Boolean read FIsHTML;
    property Priority: TMessPriority read FPriority;
  end;

  { TPosPrinterConfig }

  TPosPrinterConfig = class
  private
    FArqLog: String;
    FDeviceParams: String;
    FModelo: Integer;
    FPorta: String;
    FTimeOut: Integer;
    FPaginaDeCodigo: Integer;
    FColunasFonteNormal: Integer;
    FEspacoEntreLinhas: byte;
    FBcMostrarCodigo: Boolean;
    FBcAltura: Integer;
    FBcLarguraLinha: Integer;
    FBcMargem: Integer;
    FQrErrorLevel: Integer;
    FQrLarguraModulo: Integer;
    FQrTipo: Integer;
    FLgFatorX: Byte;
    FLgFatorY: Byte;
    FLgIgnorarLogo: Boolean;
    FLgKeyCode1: Byte;
    FLgKeyCode2: Byte;
    FGvSinalInvertido: Boolean;
    FGvTempoOFF: Byte;
    FGvTempoON: Byte;
    FMpDirecao: Integer;
    FMpEspacoEntreLinhas: Byte;
    FMpLargura: Integer;
    FMpAltura: Integer;
    FMpEsquerda: Integer;
    FMpTopo: Integer;
    FLinhasEntreCupons: Integer;
    FCortaPapel: Boolean;
    FTraduzirTags: Boolean;
    FIgnorarTags: Boolean;
    FLinhasBuffer: Integer;
    FControlePorta: Boolean;
    FVerificarImpressora: Boolean;

  public
    constructor Create;
    destructor Destroy; override;
    procedure LerIni(const AIni: TCustomIniFile);
    procedure GravarIni(const AIni: TCustomIniFile);

    property ArqLog: string read FArqLog write FArqLog;
    property DeviceParams: String read FDeviceParams write FDeviceParams;
    property Modelo: Integer read FModelo write FModelo;
    property Porta: String read FPorta write FPorta;
    property TimeOut: Integer read FTimeOut write FTimeOut;
    property PaginaDeCodigo: Integer read FPaginaDeCodigo write FPaginaDeCodigo;
    property ColunasFonteNormal: Integer read FColunasFonteNormal write FColunasFonteNormal;
    property EspacoEntreLinhas: byte read FEspacoEntreLinhas write FEspacoEntreLinhas;
    property BcMostrarCodigo: Boolean read FBcMostrarCodigo write FBcMostrarCodigo;
    property BcLarguraLinha: Integer read FBcLarguraLinha write FBcLarguraLinha;
    property BcAltura: Integer read FBcAltura write FBcAltura;
    property BcMargem: Integer read FBcMargem write FBcMargem;
    property QrTipo: Integer read FQrTipo write FQrTipo;
    property QrLarguraModulo: Integer read FQrLarguraModulo write FQrLarguraModulo;
    property QrErrorLevel: Integer read FQrErrorLevel write FQrErrorLevel;
    property LgIgnorarLogo: Boolean read FLgIgnorarLogo write FLgIgnorarLogo;
    property LgKeyCode1: Byte read FLgKeyCode1 write FLgKeyCode1;
    property LgKeyCode2: Byte read FLgKeyCode2 write FLgKeyCode2;
    property LgFatorX: Byte read FLgFatorX write FLgFatorX ;
    property LgFatorY: Byte read FLgFatorY write FLgFatorY;
    property GvSinalInvertido: Boolean read FGvSinalInvertido write FGvSinalInvertido;
    property GvTempoON: Byte read FGvTempoON write FGvTempoON;
    property GvTempoOFF: Byte read FGvTempoOFF write FGvTempoOFF;
    property MpLargura: Integer read FMpLargura write FMpLargura;
    property MpAltura: Integer read FMpAltura write FMpAltura;
    property MpEsquerda: Integer read FMpEsquerda write FMpEsquerda;
    property MpTopo: Integer read FMpTopo write FMpTopo;
    property MpDirecao: Integer read FMpDirecao write FMpDirecao;
    property MpEspacoEntreLinhas: Byte read FMpEspacoEntreLinhas write FMpEspacoEntreLinhas;
    property LinhasEntreCupons: Integer read FLinhasEntreCupons write FLinhasEntreCupons;
    property CortaPapel: Boolean read FCortaPapel write FCortaPapel;
    property TraduzirTags: Boolean read FTraduzirTags write FTraduzirTags;
    property IgnorarTags: Boolean read FIgnorarTags write FIgnorarTags;
    property LinhasBuffer: Integer read FLinhasBuffer write FLinhasBuffer;
    property ControlePorta: Boolean read FControlePorta write FControlePorta;
    property VerificarImpressora: Boolean read FVerificarImpressora write FVerificarImpressora;
  end;

  { TEmpresaConfig }

  TEmpresaConfig = class
  private
    FSessao: String;
    FCNPJ: String;
    FEmail: String;
    FNomeFantasia: String;
    FRazaoSocial: String;
    FResponsavel: String;
    FTelefone: String;
    FWebSite: String;
  public
    constructor Create(AIdentificador: String);
    procedure DefinirValoresPadroes;
    procedure LerIni(const AIni: TCustomIniFile);
    procedure GravarIni(const AIni: TCustomIniFile);

    property Sessao: String read FSessao;
    property CNPJ: String read FCNPJ;
    property RazaoSocial: String read FRazaoSocial;
    property NomeFantasia: String read FNomeFantasia;
    property WebSite: String read FWebSite;
    property Email: String read FEmail;
    property Telefone: String read FTelefone;
    property Responsavel: String read FResponsavel;
  end;

  { TLibConfig }

  TLibConfig = class
  private
    FOwner: TObject;
    FEmail: TEmailConfig;
    FPosPrinter: TPosPrinterConfig;
    FIni: TMemIniFile;
    FLog: TLogConfig;
    FNomeArquivo: String;
    FChaveCrypt: AnsiString;
    FProxyInfo: TProxyConfig;
    FSistema: TSistemaConfig;
    FSoftwareHouse: TEmpresaConfig;
    FEmissor: TEmpresaConfig;
    FTipoResposta: TACBrLibRespostaTipo;

    procedure SetNomeArquivo(AValue: String);
    procedure VerificarNomeEPath(Gravando: Boolean);
    procedure VerificarSessaoEChave(ASessao, AChave: String);

  protected
    function AtualizarArquivoConfiguracao: Boolean; virtual;
    procedure AplicarConfiguracoes; virtual;

    procedure INIParaClasse; virtual;
    procedure ClasseParaINI; virtual;
    procedure ClasseParaComponentes; virtual;

    procedure Travar; virtual;
    procedure Destravar; virtual;

    property Owner: TObject read FOwner;

  public
    constructor Create(AOwner: TObject; ANomeArquivo: String = ''; AChaveCrypt: AnsiString = ''); virtual;
    destructor Destroy; override;

    procedure Ler; virtual;
    procedure Gravar; virtual;

    procedure GravarValor(ASessao, AChave, AValor: String);
    function LerValor(ASessao, AChave: String): String;

    property NomeArquivo: String read FNomeArquivo write SetNomeArquivo;
    property ChaveCrypt: String read FChaveCrypt;

    property TipoResposta: TACBrLibRespostaTipo read FTipoResposta;
    property Log: TLogConfig read FLog;
    property ProxyInfo: TProxyConfig read FProxyInfo;
    property Email: TEmailConfig read FEmail;
    property PosPrinter: TPosPrinterConfig read FPosPrinter;
    property SoftwareHouse: TEmpresaConfig read FSoftwareHouse;
    property Sistema: TSistemaConfig read FSistema;
    property Emissor: TEmpresaConfig read FEmissor;

    property Ini: TMemIniFile read FIni;
  end;

implementation

uses
  ACBrLibConsts, ACBrLibComum,
  ACBrUtil;

{ TSistemaConfig }

constructor TSistemaConfig.Create;
begin
  inherited Create;
  DefinirValoresPadroes;
end;

procedure TSistemaConfig.DefinirValoresPadroes;
begin
  FData := 0;
  FDescricao := '';
  FNome := '';
  FVersao := '';
end;

procedure TSistemaConfig.LerIni(const AIni: TCustomIniFile);
begin
  FNome := AIni.ReadString(CSessaoSistema, CChaveNome, FNome);
  FVersao := AIni.ReadString(CSessaoSistema, CChaveVersao, FVersao);
  FData := AIni.ReadDateTime(CSessaoSistema, CChaveData, FData);
  FDescricao := AIni.ReadString(CSessaoSistema, CChaveDescricao, FDescricao);
end;

procedure TSistemaConfig.GravarIni(const AIni: TCustomIniFile);
begin
  AIni.WriteString(CSessaoSistema, CChaveNome, FNome);
  AIni.WriteString(CSessaoSistema, CChaveVersao, FVersao);
  AIni.WriteDateTime(CSessaoSistema, CChaveData, FData);
  AIni.WriteString(CSessaoSistema, CChaveDescricao, FDescricao);
end;

{ TProxyConfig }

constructor TProxyConfig.Create(AChaveCrypt: AnsiString);
begin
  inherited Create;
  FChaveCrypt := AChaveCrypt;
  DefinirValoresPadroes;
end;

procedure TProxyConfig.DefinirValoresPadroes;
begin
  FServidor := '';
  FPorta := 0;
  FUsuario := '';
  FSenha := '';
end;

function TProxyConfig.GetSenha: String;
begin
  Result := B64CryptToString(FSenha, FChaveCrypt);
end;

procedure TProxyConfig.LerIni(const AIni: TCustomIniFile);
begin
  FServidor := AIni.ReadString(CSessaoProxy, CChaveServidor, FServidor);
  FPorta := AIni.ReadInteger(CSessaoProxy, CChavePorta, FPorta);
  FUsuario := AIni.ReadString(CSessaoProxy, CChaveUsuario, FUsuario);
  FSenha := AIni.ReadString(CSessaoProxy, CChaveSenha, '');
end;

procedure TProxyConfig.GravarIni(const AIni: TCustomIniFile);
begin
  AIni.WriteString(CSessaoProxy, CChaveServidor, FServidor);
  AIni.WriteInteger(CSessaoProxy, CChavePorta, FPorta);
  AIni.WriteString(CSessaoProxy, CChaveUsuario, FUsuario);
  AIni.WriteString(CSessaoProxy, CChaveSenha, StringToB64Crypt(FSenha, FChaveCrypt));
end;

{ TEmailConfig }

constructor TEmailConfig.Create(AChaveCrypt: AnsiString);
begin
  inherited Create;
  FChaveCrypt := AChaveCrypt;
  DefinirValoresPadroes;
end;

procedure TEmailConfig.DefinirValoresPadroes;
begin
  FNome := '';
  FServidor := '';
  FConta := '';
  FUsuario := '';
  FSenha := '';
  FCodificacao := UTF_8;
  FPorta := 0;
  FSSL := False;
  FTLS := False;
  FConfirmacao := False;
  FConfirmacaoEntrega := False;
  FSegundoPlano := False;
  FTimeOut := 0;
  FTentativas := 0;
  FIsHTML := False;
  FPriority := MP_low;
end;

function TEmailConfig.GetSenha: String;
begin
  Result := B64CryptToString(FSenha, FChaveCrypt);
end;

procedure TEmailConfig.LerIni(const AIni: TCustomIniFile);
begin
  FNome := AIni.ReadString(CSessaoEmail, CChaveNome, FNome);
  FServidor := AIni.ReadString(CSessaoEmail, CChaveServidor, FServidor);
  FConta := AIni.ReadString(CSessaoEmail, CChaveEmailConta, FConta);
  FUsuario := AIni.ReadString(CSessaoEmail, CChaveUsuario, FUsuario);
  FSenha := AIni.ReadString(CSessaoEmail, CChaveSenha, '');
  FCodificacao := TMimeChar(AIni.ReadInteger(CSessaoEmail, CChaveEmailCodificacao, Integer(FCodificacao)));
  FPorta := AIni.ReadInteger(CSessaoEmail, CChavePorta, FPorta);
  FSSL := AIni.ReadBool(CSessaoEmail, CChaveEmailSSL, FSSL);
  FTLS := AIni.ReadBool(CSessaoEmail, CChaveEmailTLS, FTLS);
  FTimeOut := AIni.ReadInteger(CSessaoEmail, CChaveTimeOut, FTimeOut);
  FConfirmacao := AIni.ReadBool(CSessaoEmail, CChaveEmailConfirmacao, FConfirmacao);
  FConfirmacaoEntrega := AIni.ReadBool(CSessaoEmail, CChaveEmailConfirmacaoEntrega, FConfirmacaoEntrega);
  FSegundoPlano := AIni.ReadBool(CSessaoEmail, CChaveEmailSegundoPlano, FSegundoPlano);
  FTentativas := AIni.ReadInteger(CSessaoEmail, CChaveEmailTentativas, FTentativas);
  FIsHTML := AIni.ReadBool(CSessaoEmail, CChaveEmailIsHTML, FIsHTML);
  FPriority := TMessPriority(AIni.ReadInteger(CSessaoEmail, CChaveEmailPriority, Integer(FPriority)));
end;

procedure TEmailConfig.GravarIni(const AIni: TCustomIniFile);
begin
  AIni.WriteString(CSessaoEmail, CChaveNome, FNome);
  AIni.WriteString(CSessaoEmail, CChaveServidor, FServidor);
  AIni.WriteString(CSessaoEmail, CChaveEmailConta, FConta);
  AIni.WriteString(CSessaoEmail, CChaveUsuario, FUsuario);
  AIni.WriteString(CSessaoEmail, CChaveSenha, StringToB64Crypt(FSenha, FChaveCrypt));
  AIni.WriteInteger(CSessaoEmail, CChaveEmailCodificacao, Integer(FCodificacao));
  AIni.WriteInteger(CSessaoEmail, CChavePorta, FPorta);
  AIni.WriteBool(CSessaoEmail, CChaveEmailSSL, FSSL);
  AIni.WriteBool(CSessaoEmail, CChaveEmailTLS, FTLS);
  AIni.WriteInteger(CSessaoEmail, CChaveTimeOut, FTimeOut);
  AIni.WriteBool(CSessaoEmail, CChaveEmailConfirmacao, FConfirmacao);
  AIni.WriteBool(CSessaoEmail, CChaveEmailConfirmacaoEntrega, FConfirmacaoEntrega);
  AIni.WriteBool(CSessaoEmail, CChaveEmailSegundoPlano, FSegundoPlano);
  AIni.WriteInteger(CSessaoEmail, CChaveEmailTentativas, FTentativas);
  AIni.WriteBool(CSessaoEmail, CChaveEmailIsHTML, FIsHTML);
  AIni.WriteInteger(CSessaoEmail, CChaveEmailPriority, Integer(FPriority));
end;

{ TPosPrinterConfig }
constructor TPosPrinterConfig.Create;
begin
  FModelo := 0;
  FDeviceParams := '';
  FPorta := '';
  FTimeOut := 3;
  FPaginaDeCodigo := 2;
  FColunasFonteNormal := 48;
  FEspacoEntreLinhas := 0;
  FBcMostrarCodigo := False;
  FBcAltura := 0;
  FBcLarguraLinha := 0;
  FBcMargem := 0;
  FQrErrorLevel := 0;
  FQrLarguraModulo := 4;
  FQrTipo := 2;
  FLgFatorX := 1;
  FLgFatorY := 1;
  FLgIgnorarLogo := False;
  FLgKeyCode1 := 32;
  FLgKeyCode2 := 32;
  FGvSinalInvertido := False;
  FGvTempoOFF := 200;
  FGvTempoON := 50;
  FMpDirecao := 0;
  FMpEspacoEntreLinhas := 0;
  FMpLargura := 0;
  FMpAltura := 0;
  FMpEsquerda := 0;
  FMpTopo := 0;
  FLinhasEntreCupons := 21;
  FCortaPapel := True;
  FTraduzirTags := True;
  FIgnorarTags := False;
  FLinhasBuffer := 0;
  FControlePorta := False;
  FVerificarImpressora := False;

end;

destructor TPosPrinterConfig.Destroy;
begin
  inherited Destroy;
end;

procedure TPosPrinterConfig.LerIni(const AIni: TCustomIniFile);
begin
  FArqLog := AIni.ReadString(CSessaoPosPrinter, CChaveArqLog, FArqLog);
  FModelo := AIni.ReadInteger(CSessaoPosPrinter, CChaveModelo, FModelo);
  FDeviceParams := AIni.ReadString(CSessaoPosPrinter, CChaveDevice, FDeviceParams);
  FPorta := AIni.ReadString(CSessaoPosPrinter, CChavePorta, FPorta);
  FTimeOut := AIni.ReadInteger(CSessaoPosPrinter, CChaveTimeOut, FTimeOut);
  FPaginaDeCodigo := AIni.ReadInteger(CSessaoPosPrinter, CChavePaginaDeCodigo, FPaginaDeCodigo);
  FColunasFonteNormal := AIni.ReadInteger(CSessaoPosPrinter, CChaveColunasFonteNormal, FColunasFonteNormal);
  FEspacoEntreLinhas :=  AIni.ReadInteger(CSessaoPosPrinter, CChaveEspacoEntreLinhas, FEspacoEntreLinhas);
  FLinhasEntreCupons :=  AIni.ReadInteger(CSessaoPosPrinter, CChaveLinhasEntreCupons, FLinhasEntreCupons);
  FCortaPapel :=  AIni.ReadBool(CSessaoPosPrinter, CChaveCortaPapel, FCortaPapel);
  FTraduzirTags :=  AIni.ReadBool(CSessaoPosPrinter, CChaveTraduzirTags, FTraduzirTags);
  FIgnorarTags :=  AIni.ReadBool(CSessaoPosPrinter, CChaveIgnorarTags, FIgnorarTags);
  FLinhasBuffer :=  AIni.ReadInteger(CSessaoPosPrinter, CChaveLinhasBuffer, FLinhasBuffer);
  FControlePorta :=  AIni.ReadBool(CSessaoPosPrinter, CChaveControlePorta, FControlePorta);
  FVerificarImpressora :=  AIni.ReadBool(CSessaoPosPrinter, CChaveVerificarImpressora, FVerificarImpressora);

  FBcMostrarCodigo :=  AIni.ReadBool(CSessaoPosPrinterBarras, CChaveCBMostrarCodigo, FBcMostrarCodigo);
  FBcLarguraLinha :=  AIni.ReadInteger(CSessaoPosPrinterBarras, CChaveCBLarguraLinha, FBcLarguraLinha);
  FBcAltura :=  AIni.ReadInteger(CSessaoPosPrinterBarras, CChaveCBAltura, FBcAltura);
  FBcMargem :=  AIni.ReadInteger(CSessaoPosPrinterBarras, CChaveCBMargem, FBcMargem);

  FQrTipo :=  AIni.ReadInteger(CSessaoPosPrinterQRCode, CChaveQRTipo, FQrTipo);
  FQrLarguraModulo :=  AIni.ReadInteger(CSessaoPosPrinterQRCode, CChaveQRLarguraModulo, FQrLarguraModulo);
  FQrErrorLevel :=  AIni.ReadInteger(CSessaoPosPrinterQRCode, CChaveQRErrorLevel, FQrErrorLevel);

  FLgIgnorarLogo := AIni.ReadBool(CSessaoPosPrinterLogo, CChaveLGIgnorarLogo, FLgIgnorarLogo);
  FLgKeyCode1 := AIni.ReadInteger(CSessaoPosPrinterLogo, CChaveLGKeyCode1, FLgKeyCode1);
  FLgKeyCode2 := AIni.ReadInteger(CSessaoPosPrinterLogo, CChaveLGKeyCode2, FLgKeyCode2);
  FLgFatorX := AIni.ReadInteger(CSessaoPosPrinterLogo, CChaveLGFatorX, FLgFatorX);
  FLgFatorY := AIni.ReadInteger(CSessaoPosPrinterLogo, CChaveLGFatorY, FLgFatorY);

  FGvSinalInvertido :=  AIni.ReadBool(CSessaoPosPrinterGaveta, CChaveGVSinalInvertido, FGvSinalInvertido);
  FGvTempoON :=  AIni.ReadInteger(CSessaoPosPrinterGaveta, CChaveGVTempoON, FGvTempoON);
  FGvTempoOFF :=  AIni.ReadInteger(CSessaoPosPrinterGaveta, CChaveGVTempoOFF, FGvTempoOFF);

  FMpLargura := AIni.ReadInteger(CSessaoPosPrinterMPagina, CChaveMPLargura, FMpLargura);
  FMpAltura := AIni.ReadInteger(CSessaoPosPrinterMPagina, CChaveMPAltura, FMpAltura);
  FMpEsquerda := AIni.ReadInteger(CSessaoPosPrinterMPagina, CChaveMPEsquerda, FMpEsquerda);
  FMpTopo := AIni.ReadInteger(CSessaoPosPrinterMPagina, CChaveMPTopo, FMpTopo);
  FMpDirecao := AIni.ReadInteger(CSessaoPosPrinterMPagina, CChaveMPDirecao, FMpDirecao);
  FMpEspacoEntreLinhas := AIni.ReadInteger(CSessaoPosPrinterMPagina, CChaveMPEspacoEntreLinhas, FMpEspacoEntreLinhas);
end;

procedure TPosPrinterConfig.GravarIni(const AIni: TCustomIniFile);
begin
  AIni.WriteString(CSessaoPosPrinter, CChaveArqLog, FArqLog);
  AIni.WriteInteger(CSessaoPosPrinter, CChaveModelo, Integer(FModelo));
  AIni.WriteString(CSessaoPosPrinter, CChaveDevice, FDeviceParams);
  AIni.WriteString(CSessaoPosPrinter, CChavePorta, FPorta);
  AIni.WriteInteger(CSessaoPosPrinter, CChaveTimeOut, FTimeOut);
  AIni.WriteInteger(CSessaoPosPrinter, CChavePaginaDeCodigo, Integer(FPaginaDeCodigo));
  AIni.WriteInteger(CSessaoPosPrinter, CChaveColunasFonteNormal, FColunasFonteNormal);
  AIni.WriteInteger(CSessaoPosPrinter, CChaveEspacoEntreLinhas, FEspacoEntreLinhas);
  AIni.WriteInteger(CSessaoPosPrinter, CChaveLinhasEntreCupons, FLinhasEntreCupons);
  AIni.WriteBool(CSessaoPosPrinter, CChaveCortaPapel, FCortaPapel);
  AIni.WriteBool(CSessaoPosPrinter, CChaveTraduzirTags, FTraduzirTags);
  AIni.WriteBool(CSessaoPosPrinter, CChaveIgnorarTags, FIgnorarTags);
  AIni.WriteInteger(CSessaoPosPrinter, CChaveLinhasBuffer, FLinhasBuffer);
  AIni.WriteBool(CSessaoPosPrinter, CChaveControlePorta, FControlePorta);
  AIni.WriteBool(CSessaoPosPrinter, CChaveVerificarImpressora, FVerificarImpressora);

  AIni.WriteBool(CSessaoPosPrinterBarras, CChaveCBMostrarCodigo, FBcMostrarCodigo);
  AIni.WriteInteger(CSessaoPosPrinterBarras, CChaveCBLarguraLinha, FBcLarguraLinha);
  AIni.WriteInteger(CSessaoPosPrinterBarras, CChaveCBAltura, FBcAltura);
  AIni.WriteInteger(CSessaoPosPrinterBarras, CChaveCBMargem, FBcMargem);

  AIni.WriteInteger(CSessaoPosPrinterQRCode, CChaveQRTipo, FQrTipo);
  AIni.WriteInteger(CSessaoPosPrinterQRCode, CChaveQRLarguraModulo, FQrLarguraModulo);
  AIni.WriteInteger(CSessaoPosPrinterQRCode, CChaveQRErrorLevel, FQrErrorLevel);

  AIni.WriteBool(CSessaoPosPrinterLogo, CChaveLGIgnorarLogo, FLgIgnorarLogo);
  AIni.WriteInteger(CSessaoPosPrinterLogo, CChaveLGKeyCode1, FLgKeyCode1);
  AIni.WriteInteger(CSessaoPosPrinterLogo, CChaveLGKeyCode2, FLgKeyCode2);
  AIni.WriteInteger(CSessaoPosPrinterLogo, CChaveLGFatorX, FLgFatorX);
  AIni.WriteInteger(CSessaoPosPrinterLogo, CChaveLGFatorY, FLgFatorY);

  AIni.WriteBool(CSessaoPosPrinterGaveta, CChaveGVSinalInvertido, FGvSinalInvertido);
  AIni.WriteInteger(CSessaoPosPrinterGaveta, CChaveGVTempoON, FGvTempoON);
  AIni.WriteInteger(CSessaoPosPrinterGaveta, CChaveGVTempoOFF, FGvTempoOFF);

  AIni.WriteInteger(CSessaoPosPrinterMPagina, CChaveMPLargura, FMpLargura);
  AIni.WriteInteger(CSessaoPosPrinterMPagina, CChaveMPAltura, FMpAltura);
  AIni.WriteInteger(CSessaoPosPrinterMPagina, CChaveMPEsquerda, FMpEsquerda);
  AIni.WriteInteger(CSessaoPosPrinterMPagina, CChaveMPTopo, FMpTopo);
  AIni.WriteInteger(CSessaoPosPrinterMPagina, CChaveMPDirecao, Integer(FMpDirecao));
  AIni.WriteInteger(CSessaoPosPrinterMPagina, CChaveMPEspacoEntreLinhas, FMpEspacoEntreLinhas);
end;

{ TEmpresaConfig }

constructor TEmpresaConfig.Create(AIdentificador: String);
begin
  inherited Create;

  FSessao := AIdentificador;
  DefinirValoresPadroes;
end;

procedure TEmpresaConfig.DefinirValoresPadroes;
begin
  FCNPJ := '';
  FRazaoSocial := '';
  FNomeFantasia := '';
  FWebSite := '';
  FEmail := '';
  FTelefone := '';
  FResponsavel := '';
end;

procedure TEmpresaConfig.LerIni(const AIni: TCustomIniFile);
begin
  FCNPJ := OnlyNumber(AIni.ReadString(FSessao, CChaveCNPJ, FCNPJ));
  FRazaoSocial := AIni.ReadString(FSessao, CChaveRazaoSocial, FRazaoSocial);
  FNomeFantasia := AIni.ReadString(FSessao, CChaveNomeFantasia, FNomeFantasia);
  FWebSite := AIni.ReadString(FSessao, CChaveWebSite, FWebSite);
  FEmail := AIni.ReadString(FSessao, CChaveEmail, FEmail);
  FTelefone := AIni.ReadString(FSessao, CChaveTelefone, FTelefone);
  FResponsavel := AIni.ReadString(FSessao, CChaveResponsavel, FResponsavel);
end;

procedure TEmpresaConfig.GravarIni(const AIni: TCustomIniFile);
begin
  AIni.WriteString(FSessao, CChaveCNPJ, FCNPJ);
  AIni.WriteString(FSessao, CChaveRazaoSocial, FRazaoSocial);
  AIni.WriteString(FSessao, CChaveNomeFantasia, FNomeFantasia);
  AIni.WriteString(FSessao, CChaveWebSite, FWebSite);
  AIni.WriteString(FSessao, CChaveEmail, FEmail);
  AIni.WriteString(FSessao, CChaveTelefone, FTelefone);
  AIni.WriteString(FSessao, CChaveRazaoSocial, FRazaoSocial);
  AIni.WriteString(FSessao, CChaveResponsavel, FResponsavel);
end;

{ TLogConfig }

constructor TLogConfig.Create;
begin
  inherited Create;
  DefinirValoresPadroes;
end;

procedure TLogConfig.DefinirValoresPadroes;
begin
  FNivel := logNenhum;
  FPath := '';
end;

procedure TLogConfig.SetPath(AValue: String);
begin
  if (FPath = AValue) then
    Exit;

  FPath := PathWithoutDelim(ExtractFilePath(AValue));
end;

procedure TLogConfig.LerIni(const AIni: TCustomIniFile);
begin
  FNivel := TNivelLog(AIni.ReadInteger(CSessaoPrincipal, CChaveLogNivel, Integer(FNivel)));
  FPath := AIni.ReadString(CSessaoPrincipal, CChaveLogPath, FPath);
end;

procedure TLogConfig.GravarIni(const AIni: TCustomIniFile);
begin
  AIni.WriteInteger(CSessaoPrincipal, CChaveLogNivel, Integer(FNivel));
  AIni.WriteString(CSessaoPrincipal, CChaveLogPath, FPath);
end;

{ TLibConfig }

constructor TLibConfig.Create(AOwner: TObject; ANomeArquivo: String; AChaveCrypt: AnsiString);
begin
  if not (AOwner is TACBrLib) then
    raise EACBrLibException.Create(ErrLibNaoInicializada, SErrLibDono);

  inherited Create;

  FOwner := AOwner;
  FNomeArquivo := Trim(ANomeArquivo);
  if Length(Trim(AChaveCrypt)) = 0 then
    FChaveCrypt := CLibChaveCrypt
  else
    FChaveCrypt := AChaveCrypt;

  FTipoResposta := resINI;
  FLog := TLogConfig.Create;
  FSistema := TSistemaConfig.Create;
  FEmail := TEmailConfig.Create(FChaveCrypt);
  FPosPrinter := TPosPrinterConfig.Create();
  FProxyInfo := TProxyConfig.Create(FChaveCrypt);
  FSoftwareHouse := TEmpresaConfig.Create(CSessaoSwHouse);
  FEmissor := TEmpresaConfig.Create(CSessaoEmissor);

  FIni := TMemIniFile.Create('');

  TACBrLib(FOwner).GravarLog(ClassName + '.Create(' + FNomeArquivo + ', ' +
    StringOfChar('*', Length(FChaveCrypt)) + ' )', logCompleto);
end;

destructor TLibConfig.Destroy;
begin
  TACBrLib(FOwner).GravarLog(ClassName + '.Destroy', logCompleto);

  FIni.Free;
  FLog.Free;
  FSistema.Free;
  FEmissor.Free;
  FSoftwareHouse.Free;
  FProxyInfo.Free;
  FEmail.Free;
  FPosPrinter.Free;

  inherited Destroy;
end;

procedure TLibConfig.VerificarNomeEPath(Gravando: Boolean);
var
  APath: String;
begin
  if EstaVazio(FNomeArquivo) then
    FNomeArquivo := ApplicationPath + CNomeArqConf;

  APath := ExtractFilePath(FNomeArquivo);
  if NaoEstaVazio(APath) then
  begin
    if (not DirectoryExists(APath)) then
      raise EACBrLibException.Create(ErrDiretorioNaoExiste, Format(SErrDiretorioInvalido, [APath]));
  end
  else
    FNomeArquivo := ApplicationPath + ExtractFileName(FNomeArquivo);

  if (not Gravando) and (not FileExists(FNomeArquivo)) then
    raise EACBrLibException.Create(ErrArquivoNaoExiste, Format(SErrArquivoNaoExiste, [FNomeArquivo]));
end;

procedure TLibConfig.SetNomeArquivo(AValue: String);
var
  NomeArquivoAnt: String;
begin
  if FNomeArquivo = AValue then Exit;

  NomeArquivoAnt := FNomeArquivo;
  try
    FNomeArquivo := AValue;
    VerificarNomeEPath(True);
  except
    FNomeArquivo := NomeArquivoAnt;
    raise;
  end;
end;

procedure TLibConfig.VerificarSessaoEChave(ASessao, AChave: String);
var
  NaoExiste: String;
begin
  if not FIni.SectionExists(ASessao) then
    raise EACBrLibException.Create(ErrConfigLer, SErrConfSessaoNaoExiste);

  NaoExiste := '*NaoExiste*';
  if (FIni.ReadString(ASessao, AChave, NaoExiste) = NaoExiste) then
    raise EACBrLibException.Create(ErrConfigLer, SErrConfChaveNaoExiste);
end;

function TLibConfig.AtualizarArquivoConfiguracao: Boolean;
var
  Versao: String;
begin
  Versao := Ini.ReadString(CSessaoVersao, CLibNome, '0');
  Result := (CompareVersions(CLibVersao, Versao) > 0);
end;

procedure TLibConfig.AplicarConfiguracoes;
begin
  TACBrLib(FOwner).GravarLog(ClassName + '.AplicarConfiguracoes: ' + FNomeArquivo, logCompleto);
  if AtualizarArquivoConfiguracao then
    Gravar;

  Travar;
  try
    INIParaClasse;
    ClasseParaComponentes;
    TACBrLib(FOwner).GravarLog(ClassName + '.AplicarConfiguracoes - Feito', logParanoico);
  finally
    Destravar;
  end;
end;

procedure TLibConfig.Ler;
var
  ArquivoInformado: Boolean;
begin
  Travar;
  try
    ArquivoInformado := (FNomeArquivo <> '');
    VerificarNomeEPath(not ArquivoInformado);
    TACBrLib(FOwner).GravarLog(ClassName + '.Ler: ' + FNomeArquivo, logCompleto);

    if FIni.FileName <> FNomeArquivo then
      FIni.Rename(FNomeArquivo, FileExists(FNomeArquivo));

    if not FileExists(FNomeArquivo) then
    begin
      Gravar;
      Exit;
    end;

    INIParaClasse;
    AplicarConfiguracoes;
  finally
    TACBrLib(FOwner).GravarLog(ClassName + '.Ler - Feito', logParanoico);
    Destravar;
  end;
end;

procedure TLibConfig.INIParaClasse;
begin
  FTipoResposta := TACBrLibRespostaTipo(FIni.ReadInteger(CSessaoPrincipal, CChaveTipoResposta, Integer(FTipoResposta)));
  FLog.LerIni(FIni);
  FSistema.LerIni(FIni);
  FEmail.LerIni(FIni);
  FPosPrinter.LerIni(FIni);
  FProxyInfo.LerIni(FIni);
  FSoftwareHouse.LerIni(FIni);
  FEmissor.LerIni(FIni);
end;

procedure TLibConfig.Gravar;
begin
  Travar;
  try
    TACBrLib(FOwner).GravarLog(ClassName + '.Gravar: ' + FNomeArquivo, logCompleto);
    VerificarNomeEPath(True);

    ClasseParaINI;
    FIni.UpdateFile;
  finally
    TACBrLib(FOwner).GravarLog(ClassName + '.Gravar - Feito', logParanoico);
    Destravar;
  end;
end;

procedure TLibConfig.ClasseParaINI;
begin
  FIni.WriteInteger(CSessaoPrincipal, CChaveTipoResposta, Integer(FTipoResposta));
  FIni.WriteString(CSessaoVersao, CLibNome, CLibVersao);

  FLog.GravarIni(FIni);
  FSistema.GravarIni(FIni);
  FEmail.GravarIni(FIni);
  FPosPrinter.GravarIni(FIni);
  FProxyInfo.GravarIni(FIni);
  FSoftwareHouse.GravarIni(FIni);
  FEmissor.GravarIni(FIni);
end;

procedure TLibConfig.ClasseParaComponentes;
begin
  {}
end;

procedure TLibConfig.Travar;
begin
  {}
end;

procedure TLibConfig.Destravar;
begin
  {}
end;

procedure TLibConfig.GravarValor(ASessao, AChave, AValor: String);
begin
  VerificarSessaoEChave(ASessao, AChave);
  FIni.WriteString(ASessao, AChave, AValor);
  AplicarConfiguracoes;
end;

function TLibConfig.LerValor(ASessao, AChave: String): String;
begin
  VerificarSessaoEChave(ASessao, AChave);
  Result := FIni.ReadString(ASessao, AChave, '');
end;

end.