import React from "react";
import { Box, Flex, Heading , Stack } from "@chakra-ui/react";
import { Text } from '@chakra-ui/react'
import LoginPage from "./Components/LoginPage";

export default function App() {
  return (
    <>
      <Flex direction="column" alignItems="center" mt = {10}>

        <Stack direction="row" alignItems="center">
          <Heading fontFamily="Koulen, sans-serif" fontSize="6xl">Url</Heading>
          <Heading fontFamily="Koulen, sans-serif" color="#85586F" fontSize="6xl">Shortie</Heading>
        </Stack>
        <Box height="2"></Box>
        <Text fontSize='lg'>Earn Money From Short URLs 😊</Text>
        <Box height="20"></Box>
        <LoginPage></LoginPage>
      </Flex>
    </>
  );
}
