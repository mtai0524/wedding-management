using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CodeFirst.Migrations
{
    /// <inheritdoc />
    public partial class addColForTableCode : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_InvoiceCode_Code_CodeId",
                table: "InvoiceCode");

            migrationBuilder.DropForeignKey(
                name: "FK_InvoiceCode_Invoice_InvoiceId",
                table: "InvoiceCode");

            migrationBuilder.AlterColumn<int>(
                name: "InvoiceId",
                table: "InvoiceCode",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "CodeId",
                table: "InvoiceCode",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AddColumn<DateTime>(
                name: "ExpirationDate",
                table: "Code",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "Quantity",
                table: "Code",
                type: "int",
                nullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_InvoiceCode_Code_CodeId",
                table: "InvoiceCode",
                column: "CodeId",
                principalTable: "Code",
                principalColumn: "CodeId");

            migrationBuilder.AddForeignKey(
                name: "FK_InvoiceCode_Invoice_InvoiceId",
                table: "InvoiceCode",
                column: "InvoiceId",
                principalTable: "Invoice",
                principalColumn: "InvoiceID");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_InvoiceCode_Code_CodeId",
                table: "InvoiceCode");

            migrationBuilder.DropForeignKey(
                name: "FK_InvoiceCode_Invoice_InvoiceId",
                table: "InvoiceCode");

            migrationBuilder.DropColumn(
                name: "ExpirationDate",
                table: "Code");

            migrationBuilder.DropColumn(
                name: "Quantity",
                table: "Code");

            migrationBuilder.AlterColumn<int>(
                name: "InvoiceId",
                table: "InvoiceCode",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "CodeId",
                table: "InvoiceCode",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_InvoiceCode_Code_CodeId",
                table: "InvoiceCode",
                column: "CodeId",
                principalTable: "Code",
                principalColumn: "CodeId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_InvoiceCode_Invoice_InvoiceId",
                table: "InvoiceCode",
                column: "InvoiceId",
                principalTable: "Invoice",
                principalColumn: "InvoiceID",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
